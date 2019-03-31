class CreateTranscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :transcriptions do |t|

      t.binary :transcription_file
      t.string :transcription_text
      t.timestamps

    end
  end
end
