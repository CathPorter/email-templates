# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
    User.create(name: 'Test User', email: 'test.user@example.com')
    User.create(name: 'Another User', email: 'another.user@example.com')
end

if Appointment.count == 0
    Appointment.create(time: DateTime.now, notes: 'Some notes', user: User.first )
    Appointment.create(time: DateTime.now + 1.days, notes: 'Some more notes', user: User.second )
end

if EmailTemplate.count == 0
    EmailTemplate.create(name: 'book_appointment', subject: 'Thank you for booking with us', body: 'Dear {{user_name}},
Your appointment is booked at {{appt_time}}
Thank you for your custom,
The Company')
    EmailTemplateParameter.create(name: 'user_name', description: 'Client name', example: 'John Doe', email_template: EmailTemplate.last )
    EmailTemplateParameter.create(name: 'appt_time', description: 'Date and time of the appointment', example: '2018-10-09 22:00:00', email_template: EmailTemplate.last )
    EmailTemplateParameter.create(name: 'appt_notes', description: 'Notes added by the client', example: 'Special notes', email_template: EmailTemplate.last )

    EmailTemplate.create(name: 'cancel_appointment', subject: 'Your appointment has been cancelled', body: 'Dear {{user_name}},
You have cancelled your appointment with us at {{appt_time}}.
We look forward to your custom in the future.
The Company')
    EmailTemplateParameter.create(name: 'user_name', description: 'Client name', example: 'John Doe', email_template: EmailTemplate.last )
    EmailTemplateParameter.create(name: 'appt_time', description: 'Date and time of the appointment', example: '2018-10-09 22:00:00', email_template: EmailTemplate.last )

    EmailTemplate.create(name: 'appointment_list', subject: 'Admin: All booked appointments', body: 'Hi {{admin_name}}
Here are all the currently booked appointments:
{{appointment_list}}
')
    EmailTemplateParameter.create(name: 'admin_name', description: 'Admin name', example: 'John Doe', email_template: EmailTemplate.last )
    EmailTemplateParameter.create(name: 'appointment_list', description: 'Replaced by the full list of appointments', example: 'John Doe at 2018-10-09 22:00:00', email_template: EmailTemplate.last )
end
