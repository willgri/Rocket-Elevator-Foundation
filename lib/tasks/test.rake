require "ibm_watson/text_to_speech_v1"
require "json"
include IBMWatson

text_to_speech = TextToSpeechV1.new(
  iam_apikey: "{i3q-dboh27eQRf3gipo5CT9VVqF0ZE2yAbJhvWI8sjDG}",
  url: "https://stream.watsonplatform.net/text-to-speech/api"
)

voices = text_to_speech.list_voices
puts JSON.pretty_generate(voices.result)

# File.open("hello_world.wav", "wb") do |audio_file|
#   response = text_to_speech.synthesize(
#     text: "Hello world",
#     accept: "audio/wav",
#     voice: "en-US_AllisonVoice"
#   )
#   audio_file.write(response.result)
# end