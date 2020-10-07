require 'dotenv'
require 'httparty'
require 'table_print'

Dotenv.load

BASE_URL_CONVERSATIONS = 'https://slack.com/api/conversations.list'
BASE_URL_USERS = 'https://slack.com/api/users.list'
BASE_URL_CHAT = 'https://slack.com/api/chat.postMessage'

class SlackApiError < StandardError; end

class SlackRecord

  def self.users
    response = HTTParty.get( BASE_URL_USERS, query: {
        token: ENV['SLACK_API_TOKEN']
    })
    return response["members"]
  end

  def self.channels
    response = HTTParty.get( BASE_URL_CONVERSATIONS, query: {
        token: ENV['SLACK_API_TOKEN']
    })
    return response["channels"]
  end

  def self.chat
    message = 'Hello, We are testing!'
    channel = 'test-channel2'

    chat = HTTParty.post( BASE_URL_CHAT, body: {
        token: ENV['SLACK_API_TOKEN'],
        channel: channel,
        text: message
    })
    unless chat.code == 200 && chat.parsed_response["ok"]
          raise SlackApiError, "Error when posting #{message} to #{channel}, error: #{chat.parsed_response["error"]}"
        end
    return chat
  end

end