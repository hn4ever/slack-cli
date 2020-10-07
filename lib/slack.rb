#!/usr/bin/env ruby
require 'httparty'
require 'dotenv'
require 'table_print'
require_relative 'workspace'

Dotenv.load


def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new
  user_input = ""
  # TODO project

  until user_input == "quit"
    puts "\nWhat would you like to do? Please select one options: \n1. list users\n2. list channels\n3. quit"
    user_input = gets.chomp.downcase
    puts

    case user_input
    when "1", "list users"
      tp workspace.users, :user_name, :real_name, :slack_id
    when "2", "list channels"
      tp workspace.channels, :name, :topic, :member_count, :slack_id
    when "3", "quit"
      user_input = "quit"
    else
      puts "Not a valid option! Please enter one of the options again:"

    end
  end

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME