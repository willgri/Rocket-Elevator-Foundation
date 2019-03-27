class Customer < ApplicationRecord

    after_create :manage_dropbox
    belongs_to :lead, optional: true
    belongs_to :address
    belongs_to :user, optional: true
    has_many :buildings

    def manage_dropbox
        puts "manage_dropbox"
        if self.lead_id

            client = DropboxApi::Client.new(ENV['dropbox2Api'])

            customerName = self.full_name

            theLead = Lead.find(self.lead_id)
            leadFile = theLead.attached_file
            
            client.create_folder("/#{customerName}")
            client.upload "/#{customerName}/file.txt", "#{leadFile}"

            ActiveRecord::Base.connection.execute("UPDATE dominic_villemure.leads SET attached_file= null WHERE id='#{self.leads_id}';")
            
        end
    end
end
