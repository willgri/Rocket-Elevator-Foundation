require 'zendesk_api'


namespace :zendesk do

  desc "create a zendesk ticket"

  task ticket: :environment do

    # rake zendesk:ticket

    client = ZendeskAPI::Client.new do |config|
      # Mandatory:
    
      config.url = "https://hugerocketelevator.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
    
      # Basic / Token Authentication
      config.username = "danny.m.gauthier@gmail.com"
    
      # Choose one of the following depending on your authentication choice
      config.token = "t8ZqJv6wu0HSlHdZYNvKDBIjNJqNxO9bacr1k6v1"
      #config.password = ",^i65&tB#A.)_*.'C*"
    
      # OAuth Authentication
      #config.access_token = "t8ZqJv6wu0HSlHdZYNvKDBIjNJqNxO9bacr1k6v1"
      
      # Optional:
    
      # Retry uses middleware to notify the user
      # when hitting the rate limit, sleep automatically,
      # then retry the request.
      config.retry = true
    
      # Logger prints to STDERR by default, to e.g. print to stdout:
      require 'logger'
      config.logger = Logger.new(STDOUT)
    
      # Changes Faraday adapter
      # config.adapter = :patron
    
      # Merged with the default client options hash
      # config.client_options = { :ssl => false }
    
      # When getting the error 'hostname does not match the server certificate'
      # use the API at https://yoursubdomain.zendesk.com/api/v2
  
    end

    # result = client.tickets.first
    # puts result
    result = client.tickets.create!(:subject => "Test Task", :type => "task", :comment => { :value => "This is a test" }, :submitter_id => client.current_user.id, :priority => "urgent")
    puts result


  
  end

end
