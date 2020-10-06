#!/usr/bin/env ruby
require 'httparty'
require 'dotenv'
require_relative 'workspace'

Dotenv.load

BASE_URL_CONVERSATIONS = 'https://slack.com/api/conversations.list'
BASE_URL_USERS = 'https://slack.com/api/users.list'
BASE_URL_CHAT = 'https://slack.com/api/chat.postMessage' # use post here


def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new
  # something is here

  # TODO project
  puts ENV['SLACK_API_TOKEN']


  #pp response

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME