require_relative 'slack_record'
require_relative 'recipient'

class User < Recipient
  attr_reader :real_name

  def initialize(user_name:,real_name:, slack_id:)
    super(slack_id: slack_id, name: user_name)
    @real_name = real_name
  end

  def user_name
    @name
  end

  def self.list_users
    members = SlackRecord.users.map do |user|
      User.new(
        user_name: user["name"],
        real_name: user["real_name"],
        slack_id: user["id"])
    end
    return members
  end

  def details
    return "real name: #{@real_name}\n" +
        "user name : #{@name}\n" +
        "slack ID : #{@slack_id}"
  end

end
