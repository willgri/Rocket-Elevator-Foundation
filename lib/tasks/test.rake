# # frozen_string_literal: true

# require("ibm_watson/text_to_speech_v1")
# require("json")

# # If using IAM
# text_to_speech = IBMWatson::TextToSpeechV1.new(
#   iam_apikey: "_QiIyDbyoahD-Nnd3PHrGC5wxg5XB8zsT8xUhmSiwnFm"
# #   url: "https://stream.watsonplatform.net/text-to-speech/api"
# )

# # If you have username & password in your credentials use:
# # text_to_speech = IBMWatson::TextToSpeechV1.new(
# #   username: "YOUR SERVICE USERNAME",
# #   password: "YOUR SERVICE PASSWORD"
# # )

# puts JSON.pretty_generate(text_to_speech.list_voices.result)

# File.new("output.wav", "w+") do |audio_file|
#   response = text_to_speech.synthesize(
#     text: "Hello world!",
#     accept: "audio/wav",
#     voice: "en-US_AllisonVoice"
#   ).result
#   audio_file << response
# end