class Elevator < ApplicationRecord
    belongs_to :column
    
    after_commit do

        if status == "Active"
            send_sms()
        end

        if status == "Inactive"
            send_sms()
        end
      
        if status == "Intervention"
            send_sms()
        end
    end

    def send_sms
        # Download the twilio-ruby library from twilio.com/docs/libraries/ruby
        require 'twilio-ruby'
        
        account_sid = 'ACd30711fd514e270258730099ffe62b62'
        auth_token = 'e0a9eefca52202f36d935a61100b8cca'
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+13656590103' # Your Twilio number
        to = '+18193864838' # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "Warning, Elevator status changed to " + status
        )
    end
end
