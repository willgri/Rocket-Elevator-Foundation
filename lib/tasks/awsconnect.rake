require 'aws-sdk'
require 'json'


namespace :awsconnect do
  desc "TODO"
  # rake awsconnect:cred
  task cred: :environment do

    # client = Aws::EC2::Client.new(region:'us-west-2', credentials: credentials)
    tclient = Aws::TranscribeService::Client.new(
      region: 'us-east-2',
      access_key_id: 'AKIAJWCNKX5L676W4QBQ',
      secret_access_key: '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'
    )

    sclient = Aws::S3::Client.new(
      region: 'us-east-2',
      access_key_id: 'AKIAJWCNKX5L676W4QBQ',
      secret_access_key: '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'
    )

    File.open('/home/pocketpapa/Audio/testaudio.mp3', 'rb') do |file|
      sclient.put_object(bucket: 'hugeaudio', key: 'phil.mp3', body: file)
    end


    # resp = sclient.put_object({
    #   body: "testaudio.mp3", 
    #   bucket: "hugeaudio", 
    #   key: "2019-03-29-09ddd.mp3", 
    #   # tagging: "key1=value1&key2=value2", 
    # })

    resp = tclient.start_transcription_job({
      transcription_job_name: "testtranscriptphil", # required
      language_code: "en-US", # required, accepts en-US, es-US, en-AU, fr-CA, en-GB, de-DE, pt-BR, fr-FR, it-IT, ko-KR
      # media_sample_rate_hertz: 1,
      media_format: "mp3", # required, accepts mp3, mp4, wav, flac
      media: { # required
        media_file_uri: "https://s3.us-east-2.amazonaws.com/hugeaudio/phil.mp3",
      },
    })

    resp = client.get_transcription_job({
     transcription_job_name: "TranscriptionJobName", # required
    })

    # resp = client.delete_transcription_job({
    #   transcription_job_name: "first_transcript", # required
    # })

    # puts resp



  end

end
