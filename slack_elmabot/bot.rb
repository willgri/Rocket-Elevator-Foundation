require 'slack-ruby-bot'

module SlackElmabot
    class Bot < SlackRubyBot::Bot
      command 'ping' do |client, data, match|
        client.say(text: 'pong', channel: data.channel)
      end
    end
end