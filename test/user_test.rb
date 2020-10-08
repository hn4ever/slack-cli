
require_relative 'test_helper'

describe User do
  before do
    @name = "Papaya"
    @real_name = "John Smith"
    @slack_id = "3332"
    @user = User.new(user_name: @name, real_name: @real_name, slack_id: @slack_id)
  end

  describe "Initialize" do
    it "Constructs a User instance" do
      expect(@user).must_be_instance_of User
    end
  end

  describe "Users" do
  it "can list all users" do
      VCR.use_cassette("Users find all method") do
      expect(User.list_users.sample).must_be_instance_of User
      expect(User.list_users.length).must_equal 158
      end
    end
  end
end