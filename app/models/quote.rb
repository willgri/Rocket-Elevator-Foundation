class Quote < ApplicationRecord

    # after_create :createTicket

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
      
        client.tickets.create!(:subject => "QUOTE FOR: #{self.full_name} from #{self.business_name}",
        :type => "task", :comment => { :value => "The contact #{self.full_name} from company #{self.business_name} can be reached at email #{self.email} and at phone number #{self.phone_number}.
        \n \n The client require a quote for a #{self.building_type} building with a #{self.quality} installation.
        \n #{self.number_elevator} elevators are initially suggested for construction with for a total price of #{self.total_price}$."},
        :submitter_id => client.current_user.id, :priority => "urgent")
        
    end

end
