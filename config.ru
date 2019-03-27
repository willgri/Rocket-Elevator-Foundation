$LOAD_PATH.unshift(File.dirname(__FILE__))
# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

require 'dotenv'
Dotenv.load

require 'slackbot'
require 'web'

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackElmabot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackElmabot::Web

run Rails.application
