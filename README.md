# Email Templates App

## Overview

A standalone app to allow development and testing of EmailTemplate and its supporting classes outside of the larger production application where they will be used. Note that the UI design is basic because it will eventually pick up css formatting from the production application. User and Appointment are for testing only. There is no authentication.

### User requirements:
- Allow admin users to edit the texts of emails sent by the application
- Safely replace tokens without allowing raw ruby code as part of the email templates
- Provide information to the admin users about which tokens are valid for each email type
- The emails themselves are defined as part of the code and sent in response to actions taken in the production app. Admin users are therefore not permitted to create or delete EmailTemplates.

## README

* Ruby 2.5.1 / Rails 5.2.1

* Non-default Gems used: 
  - [rails-assets-datetimepicker](https://github.com/Envek/jquery-datetimepicker-rails)
  - [liquid](https://rubygems.org/gems/liquid)

* Javascript libraries used (included in layout view from cdn):
  - jquery 3.3.1 
  - jquery-ui 1.2.1
  - jquery-ui smoothness theme
  - [FontAwesome 5 free version](https://fontawesome.com/)

* For development, use sqlite database with data from the seeds.rb file.


