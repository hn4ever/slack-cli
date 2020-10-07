require 'table_print'
require_relative 'user'
require_relative 'channel'

class Workspace
  attr_reader :users, :channels

  def initialize
    @users = User.list_users
    @channels = Channel.list_channels
  end

end
