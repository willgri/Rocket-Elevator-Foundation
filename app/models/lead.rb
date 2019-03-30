class Lead < ApplicationRecord
    belongs_to :customers, optional: true

    after_create :manage_dropbox_after_create
    after_update :manage_dropbox_after_update

    def upload_the_file

        client = DropboxApi::Client.new(ENV['dropboxApi'])

        the_time = Time.now
        the_time.strftime "%Y-%m-%d %H:%M"

        theBusiness = self.business_name
        leadFile = self.attached_file
        leadFileName = self.file_name
        
        begin
        client.create_folder("/#{theBusiness}")
        client.upload("/#{theBusiness}/#{the_time.strftime "%Y-%m-%d %H:%M"}__#{leadFileName}", leadFile)
        rescue Exception
        client.upload("/#{theBusiness}/#{the_time.strftime "%Y-%m-%d %H:%M"}__#{leadFileName}", leadFile)
        end

        ActiveRecord::Base.connection.execute("UPDATE stephane_roy.leads SET attached_file = null WHERE id='#{self.id}';")
                  
    end

    def manage_dropbox_after_update
        puts "manage_dropbox_after_update"
        if self.customer_id

            self.upload_the_file

        end

    end

    def manage_dropbox_after_create

        puts "manage_dropbox_after_create"
        #client = DropboxApi::Client.new(ENV['dropboxApi'])

        Customer.all.each do |c|

            if c.business_name == self.business_name

                ActiveRecord::Base.connection.execute("UPDATE stephane_roy.leads SET customer_id =#{c.id} WHERE id = #{self.id};")

                self.upload_the_file 

                break if c.business_name == self.business_name

            end

        end

    end

    def createTicket

        puts "creating a ticket"

        client = ZendeskAPI::Client.new do |config|
          
            config.url = "https://rocketelevatorshuge.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
          
            config.username = "rocketelevatorhuge@gmail.com"
            config.token = ENV['zendeskApi']
          
            # Retry uses middleware to notify the user
            # when hitting the rate limit, sleep automatically,
            # then retry the request.
            config.retry = true
          
            # Logger prints to STDERR by default, to e.g. print to stdout:
            require 'logger'
            config.logger = Logger.new(STDOUT)
        
        end

        if self.attached_file
            attached = "The user attached a file"
        else
            attached = ""
        end

        if self.message
            mes = "Attached Message: #{self.message}"
        else
            mes = "Attached Message: None"
        end
      
        client.tickets.create!(
            :subject => "#{self.full_name} from #{self.business_name}", 
            :type => "question",
            :comment => { :value => "The contact #{self.full_name} from company #{self.business_name} can be reached at email #{self.email} and at phone number #{self.phone_number}.
        #{self.department_in_charge_of_elevators} has a project named #{self.project_name} which would require contribution from Rocket Elevators.
        \n \n #{self.project_description} \n \n #{mes} \n \n #{attached}"},
        :priority => "normal")
        
    end

end
