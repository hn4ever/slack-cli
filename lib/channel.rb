require_relative 'slack_record'
require_relative 'recipient'
class Channel < Recipient

  attr_reader :topic, :member_count

  def initialize(name:, topic:, member_count:, slack_id:)
    super(name: name, slack_id: slack_id)
    @topic = topic
    @member_count = member_count # to change?
  end

  def self.list_channels
    channels = SlackRecord.channels.map do |channel|
      Channel.new(
          name: channel["name"],
          topic: channel["topic"]["value"],
          member_count: channel["num_members"],
          slack_id: channel["id"]
      )
    end
    return channels
  end


  def details
    return "name: #{@name}\n" +
        "member_count: #{@member_count}\n" +
        "topic: #{@topic}\n" +
        "slack_id: #{@slack_id}."

  end
end



#puts Channel.list_channels[1].details

#Channel.print_channels
#
#puts Channel.list_channels.length