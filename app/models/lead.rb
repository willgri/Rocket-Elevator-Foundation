class Lead < ApplicationRecord

    after_create :createTicket

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
      
        client.tickets.create!(:subject => "#{self.full_name} from #{self.business_name}", :type => "question",
        :comment => { :value => "The contact #{self.full_name} from company #{self.business_name} can be reached at email #{self.email} and at phone number #{self.phone_number}.
        #{self.department_in_charge_of_elevators} has a project named #{self.project_name} which would require contribution from Rocket Elevators.
        \n \n #{self.project_description} \n \n #{mes} \n \n #{attached}"},
        :submitter_id => client.current_user.id, :priority => "normal")
        
    end

end
