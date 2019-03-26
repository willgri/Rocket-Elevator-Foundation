class UserNotifierMailer < ActionMailer::Base
    default from: 'rocketelevator@hotmail.com'

    # send a email to the user, pass in the user object that contains the user's email address
    def send_email(lead)
        @lead = lead
        mail( :to => @lead.email,
        :subject => 'Thank you for contacting our team!' )
    end
end
