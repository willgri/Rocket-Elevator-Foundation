namespace :dropbox do
  desc "intended to transfer from mySQL to dropbox account"

  client = DropboxApi::Client.new("mfNEh42085kAAAAAAAzK90XJnGbY0_M9TDTD1IPITGMy5I_fbGLrQ4DUCD8H3X")

  # rake dropbox:transfer
  task transfer: :environment do
    puts "let's start"

    leadName = Lead.first.full_name
    leadFile = Lead.first.attached_file
    client.create_folder("/#{leadName}")
    client.upload "/#{leadName}/file.txt", "#{leadFile}"
    # UPDATE `dominic_villemure`.`leads` SET `attached_file`=? WHERE `id`='1';
    ActiveRecord::Base.connection.execute("UPDATE `dominic_villemure`.`leads` SET `attached_file`=? WHERE `id`='10';")
    





  end

end
