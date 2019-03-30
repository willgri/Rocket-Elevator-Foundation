class Transcription < ApplicationRecord
    require 'aws-sdk'
    require 'json'
    require 'waitutil'
    require "json"
    require 'net/http'
    require 'uri'


    def transcribe_mp3
        puts "Begining to Transcribe"

        the_time = Time.now
        the_time.strftime "%Y-%m-%d %H:%M"

        the_mp3 = self.transcription_file

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
  
        sclient.put_object(bucket: 'hugeaudio', key: "#{the_time.strftime "%Y-%m-%d %H:%M"}.mp3", body: "#{the_mp3}")

      the_job = the_time.strftime "%Y_%m_%d_%H_%M"
  
      resp = tclient.start_transcription_job({
        transcription_job_name: "#{the_job}_JOB",
        language_code: "en-US",
        media_format: "mp3",
        media: {
          media_file_uri: "https://s3.us-east-2.amazonaws.com/hugeaudio/#{the_time.strftime "%Y-%m-%d %H:%M"}.mp3",
        },
      })
  
      trd = Thread.new {
        attempt = 1
        WaitUtil.wait_for_condition('my event', :verbose => true, :timeout_sec => 5000, :delay_sec => 10) do
          transcribe = tclient.get_transcription_job({
            transcription_job_name: "#{the_job}_JOB",
          })
          transcribe_status = transcribe.transcription_job.transcription_job_status
          puts transcribe_status
  
          sleep(1)
          attempt += 1
          [ transcribe_status == "COMPLETED", "attempt #{attempt}"]  # the second element goes into the log message
        end
  
        transcribe  = tclient.get_transcription_job({
          transcription_job_name: "#{the_job}_JOB", # required
        })
        transcribe_uri = transcribe.transcription_job.transcript.transcript_file_uri
        source = transcribe_uri
        response = Net::HTTP.get_response(URI.parse(source))
        data = response.body
        result = JSON.parse(data)
        puts transcription = JSON.parse(data)['results']['transcripts']

        self.transcription_text = transcription

        ActiveRecord::Base.connection.execute("UPDATE dominic_villemure.transcriptions SET transcription_text='#{transcription}' WHERE id=#{self.id};")
      }
    end
end
