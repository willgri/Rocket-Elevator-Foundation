class TranscriptionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    # AMAZON TRANSCRIPT
    def new
        @transcription = Transcription.new
    end

    def create
        @transcription = Transcription.new(transcription_params)

        @transcription.transcription_file = params[:transcription_file].read

        @transcription.save
        # respond_to do |format|
        #     if @transcription.save
        #       format.html { redirect_to @transcription, notice: 'QUOTE WAS SUCCESSFULLY SENT' }
        #       format.json { render :show, status: :created, location: @transcription}
        #     else
        #       format.html { render :new }
        #       format.json { render json: @transcription.errors, status: :unprocessable_entity }
        #     end
        #   end
        
        @transcription.transcribe_mp3
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
