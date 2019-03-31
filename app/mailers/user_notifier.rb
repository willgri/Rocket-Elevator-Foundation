class UserNotifier < ActionMailer::Base
    default :from => 'rocketelevator@gmail.com'

    #SENDGRID
    # send a email to the user, pass in the user object that contains the user's email address
    def send_email(lead)
        @lead = lead
        mail( :to => lead.email,
        :subject => 'We would like to thank you for contacting our team!' )
    end
end
