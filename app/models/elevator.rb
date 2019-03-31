class Elevator < ApplicationRecord

    before_save :elma_hook
    belongs_to :column
    before_save do
        if ((status_was != nil) and (status == "Intervention"))
            send_sms()
        end
    end

    def elma_hook
      if ((status_was != nil) and (status != status_was))
        send_to_elma(status_was)
      end
    end

    # TWILIO
    def send_sms
        # Download the twilio-ruby library from twilio.com/docs/libraries/ruby
        require 'twilio-ruby'
        
        account_sid = ENV['twilio_sid']
        auth_token = ENV['twilio_auth_token']
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = ENV['p_twilio'] # Your Twilio number
        # to = ENV['p_doum'] # Your mobile phone number (if you want to hardcode 1 phone number)
        to = "+1#{self.column.battery.building.technical_ressource_phone_number}"
        p(to)
   
        client.messages.create(
        from: from,
        to: to,
        body: "Warning, Elevator ID: " + id.to_s + " in column: " + 
        self.column.id.to_s + " in battery: " + self.column.battery.id.to_s + 
        " status changed to " + status + " at " + self.column.battery.building.address.city + 
        " City !!!"
        )
    end

    # SLACK
    def send_to_elma(status_value_before_save)
        require 'net/http'
        require 'uri'
        require 'json'
        
        uri = URI.parse(ENV['slack_url'])
        request = Net::HTTP::Post.new(uri)
        request.content_type = "application/json"
        request.body = JSON.dump({
          "text" => "The Elevator "+self.id.to_s+" with Serial Number "+
          self.serial_number.to_s+" changed status from "+status_value_before_save+
          " to "+self.status
        })

        req_options = {
          use_ssl: uri.scheme == "https",
        }
        
        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end
    end
end
