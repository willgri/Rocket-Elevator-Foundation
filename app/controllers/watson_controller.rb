require "ibm_watson/text_to_speech_v1"
require "json"
require 'net/http'
require 'uri'
require 'openssl'
include IBMWatson
class WatsonController < ApplicationController

    def watson
        uri = URI.parse("https://iam.bluemix.net/identity/token")
        request = Net::HTTP::Post.new(uri)
        request.content_type = "application/x-www-form-urlencoded"
        request["Accept"] = "application/json"
        request.set_form_data(
            "apikey" => "i3q-dboh27eQRf3gipo5CT9VVqF0ZE2yAbJhvWI8sjDG",
            "grant_type" => "urn:ibm:params:oauth:grant-type:apikey",
           )

        req_options = {
        use_ssl: uri.scheme == "https",
        verify_mode: OpenSSL::SSL::VERIFY_NONE,
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
            end

        token = JSON.parse(response.body)
        token1 = token['access_token']
        voice = "en-US_AllisonVoice"
        text = "Hello world"
        p (token)
        render :json => {text: text, token: token1, voice: voice}

        File.open("hello_world.wav", "wb") do |audio_file|
        response = token.synthesize(
        )
        audio_file.write(response.body)
    end
      

# response.code
# response.body


        # uri = URI.parse("https://stream.watsonplatform.net/authorization/api/v1/token?url=https://stream.watsonplatform.net/text-to-speech/api")
        # request = Net::HTTP::Get.new(uri)
        # request.basic_auth("apikey", "i3q-dboh27eQRf3gipo5CT9VVqF0ZE2yAbJhvWI8sjDG")

        # req_options = {
        # use_ssl: uri.scheme == "https",
        # }

        # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        # http.request(request)
        # end

        # token = response.body
        # voice = "en-US_AllisonVoice"
        # text = "Hello world"

        # render :json => {text: text, token: token, voice: voice}

# response.code
# response.body
    # text_to_speech = TextToSpeechV1.new(
    # iam_apikey: ENV['ibm_key'],
    # url: ENV['ibm_url']
    # )
    
    

    # token = text_to_speech
    # voice = "en-US_AllisonVoice"
    # text = "Hello world"
    # p (token)
    # render :json => {text: text, token: token, voice: voice}

    # voices = text_to_speech.list_voices
    # puts JSON.pretty_generate(voices.result)

    # uri = URI.parse('https://stream.watsonplatform.net/authorization/api/v1/token?url=https://stream.watsonplatform.net/text-to-speech/api')
    # request = Net::HTTP::Get.new(uri)
    # request.basic_auth("apikey", ENV['ibm_key'])
    # request.content_type = "application/json"
    # request["Accept"] = "audio/wav"
    # # request.body = JSON.dump({
    # #     "text" => "hello world, welcome to rocket elevator"
    # # })
    # p ("working ??????????????")

    # req_options = {
    # use_ssl: uri.scheme == "https",
    # }

    # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    # http.request(request)
    # end

    # request.body = JSON.dump({
    #   "text" => "hello world, welcome to rocket elevator",
    #   "voice" => "en-US_AllisonVoice",
    #   "token" => response.body
    # })

    
   


    # File.open("hello_world.wav", "wb") do |audio_file|
    #     response = text_to_speech.synthesize(
    #     text: "Hello world",
    #     accept: "audio/wav",
    #     voice: "en-US_AllisonVoice"
    #     )
    #     audio_file.write(response.result)
    # end
    # response.code
    # response.body
    end
end



# curl -X POST -u "apikey:i3q-dboh27eQRf3gipo5CT9VVqF0ZE2yAbJhvWI8sjDG" \
# --header "Content-Type: application/json" \
# --header "Accept: audio/wav" \
# --data '{"text": "hello world"}' \
# --output hello_world.wav \
# "https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize"
