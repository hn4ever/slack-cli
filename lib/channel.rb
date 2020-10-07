require 'dotenv'
require 'httparty'
require 'table_print'
require_relative 'Slack_record'

Dotenv.load

class Channel < SlackRecord
  attr_reader :name, :topic, :member_count, :slack_id

  def initialize(name:, topic:, member_count:, slack_id:)
    @name = name
    @topic = topic
    @member_count = member_count # to change?
    @slack_id = slack_id # do we need to connect channel to user by slack_id?
  end

  def self.list_channels
    channels = self.channels.map do |channel|
      Channel.new(
          name: channel["name"],
          topic: channel["topic"],
          member_count: channel["num_members"],
          slack_id: channel["id"]
      )
    end
    return channels
  end

  def self.print_channels
    channels = self.list_channels
    tp channels, :name, :topic, :member_count, :slack_id
  end
end

#Channel.print_channels