require 'dotenv'
require 'httparty'
require 'table_print'
require_relative 'Slack_record'

Dotenv.load

class User < SlackRecord
  attr_reader :user_name, :real_name, :slack_id

  def initialize(user_name:,real_name:, slack_id:)
    @user_name = user_name
    @real_name = real_name
    @slack_id = slack_id
  end

  def self.list_users
    members = self.users.map do |user|
      User.new(
        user_name: user["name"],
        real_name: user["real_name"],
        slack_id: user["id"])
    end
    return members
  end

  def self.print_users
    members = self.list_users
    tp members, :real_name,:user_name, :slack_id
  end

end

#User.print_users
