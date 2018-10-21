class NotificationMailer < ApplicationMailer
    # Use ids instead of objects for delayed job compatibility

    def notify_email(to, subject, body)
        @body = body
        mail(to: to, subject: subject)
    end
end
