require_relative 'user'
require_relative 'channel'

class WorkspaceError < StandardError; end

class Workspace
  attr_reader :users, :channels, :selected

  def initialize
    @users = User.list_users
    @channels = Channel.list_channels
    @selected = nil
  end

  def select_user(user_input)
    @users = User.list_users
    @selected = @users.find {|user| user.user_name == user_input || user.slack_id == user_input}
  end


  def select_channel(user_input)
    @channels = Channel.list_channels
    @selected = @channels.find {|channel| channel.name == user_input || channel.slack_id == user_input}
  end

  def show_details
    if @selected.nil?
      raise WorkspaceError, "You have not selected a user or channel."
    else
      return @selected.details
    end
  end

end

# puts Workspace.select_user("slackbot").details
