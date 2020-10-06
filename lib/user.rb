require 'dotenv'
require 'httparty'
require_relative 'Slack_record'

Dotenv.load

base_url_users = 'https://slack.com/api/users.list'

class User < SlackRecord
  attr_reader :user_name, :real_name, :slack_id

  def initialize(user_name:,real_name:, slack_id:)
    @user_name = user_name
    @real_name = real_name
    @slack_id = slack_id
  end

  def self.list_users
    users = self.users
    members = users.map do |user|
          self.new(
            user_name: user["name"],
            real_name: user["real_name"],
            slack_id: user["id"]
                   )
    end

    members.each do |member|
      puts "username: #{member.user_name}, real name: #{member.real_name}, slack id: #{member.slack_id}"
    end
  end

  end

User.list_users
  # def self.list_users
  # response = HTTParty.get( BASE_URL_USERS, query: {
  #     token: ENV['SLACK_API_TOKEN']
  # })
#   def self.list(base_url_users)
#     puts base_url_users
#   members = response["members"].map do |user|
#     self.new(
#       user_name: user["name"],
#       real_name: user["real_name"],
#       slack_id: user["id"]
#              )
#   end
#
#
#
#   return members
#   end
#
# end
#
# puts User.list_users.first.user_name
