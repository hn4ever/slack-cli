require_relative 'test_helper'


describe Workspace do


  describe "initializer" do
    it 'It can create a Workspace instance' do
       VCR.use_cassette(" users and channel") do
         workspace = Workspace.new
      expect(workspace).must_be_instance_of Workspace
      end
    end
  end

  describe "select_user" do

    it "It can select a user instance" do
      VCR.use_cassette(" workspacce users") do
        workplace = Workspace.new
        selected = workplace.select_user("slackbot")

      expect(selected).must_be_instance_of User
      expect(selected.name).must_equal "slackbot"
      expect(selected.real_name).must_equal "Slackbot"
      expect(selected.slack_id).must_equal "USLACKBOT"
      end
    end

  end

  describe "select_channel" do
    it "selects the correct channel" do
      VCR.use_cassette(" workspacce channels") do
        workplace = Workspace.new
        selected = workplace.select_channel("general")

        expect(selected.name).must_equal "general"
        expect(selected.slack_id).must_equal "C0165N9BX3M"
      end
    end
  end

  describe "show details" do
    it "shows details selected user/channel" do
      VCR.use_cassette(" workspacce channels") do
        workplace = Workspace.new

        expect(workplace.selected).must_be_nil

      end
    end
  end

end


