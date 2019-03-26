require 'sinatra/base'

module SlackElmabot
  class Web < Sinatra::Base
    get '/' do
      'How may I assist you?'
    end
  end
end