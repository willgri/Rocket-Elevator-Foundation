class TranscriptionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    require 'aws-sdk'
    require 'json'
    require 'waitutil'
    require "json"
    require 'net/http'
    require 'uri'


    # AMAZON TRANSCRIPT
    def new
        @transcription = Transcription.new
    end

    def create
        @transcription = Transcription.new(transcription_params)


        

            puts "Begining to Transcribe"
    
            the_time = Time.now
            the_time.strftime "%Y-%m-%d %H:%M"
    
            the_mp3 = params[:transcription_file].read

            tclient = Aws::TranscribeService::Client.new(
            region: 'us-east-2',
            access_key_id: ENV['aws_key'],
            secret_access_key: ENV['aws_secret']
        )
      
          sclient = Aws::S3::Client.new(
            region: 'us-east-2',
            access_key_id: ENV['aws_key'],
            secret_access_key: ENV['aws_secret']
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
    
    
            @transcription.transcription_text = transcription

            @transcription.save

            redirect_to admins_path
          }

    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transcription
      @transcription = Transcription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transcription_params
      params.permit(:transcription_file, :transcription_text)
    end
end
