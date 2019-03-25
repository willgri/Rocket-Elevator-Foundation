require 'sinatra/base'

module SlackElmabot
  class Web < Sinatra::Base
    get '/' do
      'Do you even elevate?'
    end
  end
end