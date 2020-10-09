require 'dotenv'
require 'table_print'
require_relative 'workspace'

def main
  Dotenv.load

  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new
  user_input = ""

  # TODO project

  until user_input == "quit"
    puts "\nWhat would you like to do? Please select one options: \n1. list users\n2. list channels\n3. select user\n4. select channel\n5. details\n6. send message\n7. quit"
    user_input = gets.chomp.downcase
    puts
    case user_input
    when "1", "list users"
      tp workspace.users, :real_name, :user_name, :slack_id
    when "2", "list channels"
      tp workspace.channels, :name, :topic, :member_count, :slack_id
    when "3", "select user"
      print "Please enter a user name or ID:"
      selection_option = gets.chomp
      selected = workspace.select_user(selection_option)
      if selected
        puts "User found"
      else
        puts "User not found"
      end
    when "4", "select channel"
      print "Please enter a channel's name or ID:"
      selection_option = gets.chomp
      selected = workspace.select_channel(selection_option)
      if selected
        puts "Channel found"
      else
        puts "Channel not found"
      end
    when "5", "details"
      begin
        puts workspace.show_details
      rescue WorkspaceError => error
        puts error.message
      end
    when "6", "send message"
      if selected
        puts "Please write a message:"
        message = gets.chomp
        SlackRecord.chat(message, selected.name)
      else
        puts "You have not entered a user or channel. Please make your selection:"
      end
    when "7", "quit"
      user_input = "quit"
    else
      puts "Not a valid option! Please enter one of the options again:"

    end
  end

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME