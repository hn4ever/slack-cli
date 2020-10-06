require 'dotenv'
require 'httparty'

Dotenv.load

BASE_URL_CONVERSATIONS = 'https://slack.com/api/conversations.list'
BASE_URL_USERS = 'https://slack.com/api/users.list'
BASE_URL_CHAT = 'https://slack.com/api/chat.postMessage'

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
    chat = HTTParty.post( BASE_URL_CHAT, body: {
        token: ENV['SLACK_API_TOKEN'],
        channel: 'test-channel2',
        text: 'Hello, We are testing!'
    })
    return chat
  end

end