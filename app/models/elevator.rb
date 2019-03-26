class Elevator < ApplicationRecord

    before_save :elma_hook

    belongs_to :column
    
    after_commit do

        if status == "Active"
            send_to_elma()
        end

        if status == "Inactive"
            send_to_elma()
        end
      
        if status == "Intervention"
            send_to_elma()
            send_sms()
        end
    end

    def elma_hook
        value_before = status_was
        value_after = status

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
        body: "Warning, Elevator ID: " + id.to_s + " in column: " + 
        self.column.id.to_s + " in battery: " + self.column.battery.id.to_s + 
        " status changed to " + status + " at " + self.column.battery.building.address.city + 
        " City !!!"
        )
    end

    def send_to_elma
        require 'net/http'
        require 'uri'
        require 'json'

        uri = URI.parse("https://hooks.slack.com/services/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")
        request = Net::HTTP::Post.new(uri)
        request.content_type = "application/json"
        request.body = JSON.dump({
          "text" => "Hello, World!"
        })
        
        req_options = {
          use_ssl: uri.scheme == "https",
        }
        
        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end
    end

# response.code
# response.body
end
