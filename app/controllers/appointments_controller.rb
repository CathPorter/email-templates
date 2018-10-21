class AppointmentsController < ApplicationController
    def index
        @appointments = Appointment.all 
        @users = User.all  
        @appointment = Appointment.new
        @appointment.time = (DateTime.now + 2.days).beginning_of_hour        
    end

    def create
        puts "Saving from "+params.inspect 

        @appointment = Appointment.new(appointment_params)

        message = 'Error booking appointment'
        if @appointment.save
          message = 'Appointment was successfully booked.'

            # Fill out the right data for this email: user_name, appt_time
            args = {} 
            args['user_name'] = @appointment.user.name 
            args['user_notes'] = @appointment.notes
            args['appt_time'] = @appointment.display_date

            # send email to user
            puts 'Send booking email'
            template = EmailTemplate.find_by(name: 'book_appointment')
            template.send_email(@appointment.user.email, args) if template          
        end

        redirect_to appointments_path, notice: message
    end

    def destroy
        @appointment = Appointment.find(params[:id]) 
        @appointment.destroy

        # Fill out the right data for this email: user_name, appt_time
        args = {} 
        args['user_name'] = @appointment.user.name 
        args['appt_time'] = @appointment.display_date

        # send email to user
        puts 'Send cancellation email'
        template = EmailTemplate.find_by(name: 'cancel_appointment')
        template.send_email(@appointment.user.email, args) if template

        redirect_to appointments_path, notice: 'Appointment was successfully cancelled.'
    end

    def export 
        # Fill out the right data for this email: admin_name, appointment_list
        appointments = Appointment.all
        list = appointments.collect {|x| x.display }

        args = {}
        args['admin_name'] = 'System Admin'
        args['appointment_list'] = list.join("\n")

        puts 'Send admin appointments email'
        template = EmailTemplate.find_by(name: 'appointment_list')
        template.send_email('admin@example.com', args) if template

        redirect_to appointments_path
    end  

    private 

    # Only allow a trusted parameter "white list" through.
    def appointment_params
        params.require(:appointment).permit(:user_id, :time)
      end
end
