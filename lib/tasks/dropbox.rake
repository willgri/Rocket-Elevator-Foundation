# namespace :dropbox do
#   desc "intended to transfer from mySQL to dropbox account"

#   client = DropboxApi::Client.new(ENV['dropboxApi'])

#   # rake dropbox:transfer
#   task transfer: :environment do
#     puts "let's start"

#     leadName = Lead.first.full_name
#     #leadFile = Lead.first.attached_file
#     leadFile = ActiveRecord::Base.connection.execute("SELECT attached_file FROM dominic_villemure.leads where ID = 3;")
#     puts leadFile
#     client.create_folder("/#{leadName}")
#     client.upload "/#{leadName}/file.txt", "#{leadFile}"
#     # UPDATE `dominic_villemure`.`leads` SET `attached_file`=? WHERE `id`='1';
#     ActiveRecord::Base.connection.execute("UPDATE dominic_villemure.leads SET attached_file= null WHERE id='10';")
    
#   end

# end
