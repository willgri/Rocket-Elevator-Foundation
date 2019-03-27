class Elevator < ApplicationRecord
    belongs_to :column
    
    after_commit do

        # if status == "Active"
        #     send_sms()
        # end

        # if status == "Inactive"
        #     send_sms()
        # end
      
        if status == "Intervention"
            send_sms()
        end
    end

    def send_sms
        # Download the twilio-ruby library from twilio.com/docs/libraries/ruby
        require 'twilio-ruby'
        
        account_sid = ENV['twilio_sid']
        auth_token = ENV['twilio_auth_token']
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = ENV['p_twilio'] # Your Twilio number
        to = ENV['p_doum'] # Your mobile phone number
   

        client.messages.create(
        from: from,
        to: to,
        body: "Warning, Elevator ID: " + id.to_s + " in column: " + 
        self.column.id.to_s + " in battery: " + self.column.battery.id.to_s + 
        " status changed to " + status + " at " + self.column.battery.building.address.city + 
        " City !!!"
        )
    end
end
