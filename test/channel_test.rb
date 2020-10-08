
require_relative 'test_helper'

describe Channel do
  before do
    @name = "Programing is fun!"
    @topic = "programming languages"
    @member_count = 54
    @slack_id = "3342"

    @channel = Channel.new(name: @name, topic: @topic, member_count: @member_count, slack_id: @slack_id)
  end

  describe "Initialize" do
    it "Constructs a Channel instance" do
      expect(@channel).must_be_instance_of Channel
    end
  end

  describe "Channels" do
    it "can list all channels" do
      VCR.use_cassette("Channels find all method") do
        expect(Channel.list_channels.sample).must_be_instance_of Channel
        expect(Channel.list_channels.length).must_equal 47
      end
    end
  end
end