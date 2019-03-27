require "ibm_watson/text_to_speech_v1"
require "json"
require 'net/http'
require 'uri'
require 'openssl'
include IBMWatson
class WatsonController < ApplicationController
    def watson

        firstName = current_admin['first_name']
        numberElevator = Elevator.count.to_s
        numberBuilding = Building.count.to_s
        numberCustomer = Customer.count.to_s
        numberInactiveElevator = Elevator.where(status: 'Inactive').count.to_s
        numberQuote = Quote.count.to_s
        numberLead = Lead.count.to_s
        numberBattery = Battery.count.to_s
        numberCity = Address.distinct(:city).count.to_s

        uri = URI.parse("https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize")
        request = Net::HTTP::Post.new(uri)
        request.basic_auth("apikey", ENV['ibm_key'])
        request.content_type = "application/json"
        request["Accept"] = "audio/ogg"
        request.body = JSON.dump({
        "text" => "Greetings," + firstName + "they are currently," + numberElevator + 
        ",elevators deployed in the," + numberBuilding + ",buildings of your," + numberCustomer +
        ",customers. Currently," + numberInactiveElevator + ",elevators are in status inactive and being serviced.
        You currently have," + numberQuote + ",quotes awaiting processing. You currently have," +
        numberLead + ",leads in your contact requests. " + numberBattery + ",batteries are deployed across," + 
        numberCity + ",cities."
        })

        req_options = {
        use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
        end

        send_data response.body
    end
end