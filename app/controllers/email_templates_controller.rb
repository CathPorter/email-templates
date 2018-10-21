class EmailTemplatesController < ApplicationController
    def index
        @email_templates = EmailTemplate.all

        @templates_active = "ui-active"
    end

    def show
        @email_template = EmailTemplate.find(params[:id])
    end

    def edit
        @email_template = EmailTemplate.find(params[:id])
    end

    def update
        @email_template = EmailTemplate.find(params[:id])
        if @email_template.update_attributes(email_template_params)
            redirect_to email_template_path(@email_template)
        else
            render :edit
        end
    end

    def preview
        @email_template = EmailTemplate.find(params[:id])
        body = params[:body]
        render plain: @email_template.preview(body)
    end

    def send_email
        # TODO - Should be a model method?
        args = params(:args)
        @email_template = EmailTemplate.find(params[:id])
        if self.method_defined?(@email_template.name.to_s)
            self.send(@email_template.name, args)
        end
    end

    protected

    def book_appointment(args)
        # extract objects from args
        user_id = args[:user_id]

        # Parse the body text using known params
        subject = @email_template.subject
        body = @email_template.body

        # Send the email
        NotificationMailer.user_email(user_id, subject, body)
    end

    def cancel_appointment(args)
        # extract objects from args
        user_id = args[:user_id]

        # Parse the body text using known params
        subject = @email_template.subject
        body = @email_template.body

        # Send the email
        NotificationMailer.user_email(user_id, subject, body)
    end

    def appointment_list(args)
        # Parse the body text using known params
        subject = @email_template.subject
        body = @email_template.body

        # Send the email
        NotificationMailer.admin_email(subject, body)
    end

    def email_template_params
        params.require(:email_template).permit(:subject, :body)
    end

end
