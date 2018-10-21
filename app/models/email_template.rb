class EmailTemplate < ApplicationRecord
    has_many :email_template_parameters, dependent: :destroy

    validates :name, presence: true, uniqueness: true
    validates :subject, presence: true
    validates :body, presence: true

    def preview(raw_template = nil)
        raw_template ||= self.body

        begin
            # Read the template
            template = Liquid::Template.parse(raw_template)

            # Set up the examples from the parameter definition
            args = {}
            email_template_parameters.each do |param|
                args[param.name] = param.example
            end

            # Parse the template

            text = template.render(args)
        rescue Liquid::SyntaxError => error
            text = 'ERROR: '+error.message
        end
        return text
    end

    def send_email(to, args) 
        puts 'Sending email'
        parsed_subject = parse(subject, args)
        parsed_body = parse(body, args)
        NotificationMailer.notify_email(to, parsed_subject, parsed_body).deliver
    end

    def parse(text, args)
        result = nil
        begin
            template = Liquid::Template.parse(text)
            result = template.render(args)
        rescue Liquid::SyntaxError => error
            puts "Unable to send email #{name}: #{error.message}"
        end
        result
    end
end
