namespace :test do
    desc "Connection task"
        task watson: :environment do

        require "ibm_watson/text_to_speech_v1"
        require "json"
        require 'net/http'
        require 'uri'
        include IBMWatson

        

        text_to_speech = TextToSpeechV1.new(
        iam_apikey: "{i3q-dboh27eQRf3gipo5CT9VVqF0ZE2yAbJhvWI8sjDG}",
        url: "{https://stream.watsonplatform.net/text-to-speech/api}"
        )

        voice = text_to_speech.get_voice(
            voice: "en-US_AllisonVoice")

        p JSON.pretty_generate(voice.result)
        
        # token = text_to_speech
        # voice = "en-US_AllisonVoice"
        # text = "Hello world"
        # p (token)
        # render :json => {text: text, token: token, voice: voice}

        # voices = text_to_speech.list_voices
        # puts JSON.pretty_generate(voices.result)

        # uri = URI.parse(ENV['ibm_url'])
        # request = Net::HTTP::Post.new(uri)
        # request.basic_auth("apikey", ENV['ibm_key'])
        # request.content_type = "application/json"
        # request["Accept"] = "audio/wav"
        # request.body = JSON.dump({
        #   "text" => "hello world, welcome to rocket elevator"
        # })
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