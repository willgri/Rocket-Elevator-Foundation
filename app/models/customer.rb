class Customer < ApplicationRecord

    after_create :manage_dropbox
    belongs_to :lead, optional: true
    belongs_to :address
    belongs_to :user, optional: true
    has_many :buildings

    def manage_dropbox
        puts "manage_dropbox"
        if self.lead_id

            client = DropboxApi::Client.new(ENV['dropboxApi'])

            customerName = self.full_name

            theLead = Lead.find(self.lead_id)
            leadFile = theLead.attached_file
            
            client.create_folder("/#{customerName}")
            client.upload "/#{customerName}/#{customerName}_file.binary", "#{leadFile}"

            ActiveRecord::Base.connection.execute("UPDATE dominic_villemure.leads SET attached_file= null WHERE id='#{self.lead_id}';")
            
        end
    end
end
