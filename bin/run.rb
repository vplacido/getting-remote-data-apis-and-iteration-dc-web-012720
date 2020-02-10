#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require "rest-client"
require 'JSON'
# require 'awesome_print'
require "pry"


welcome
character = get_character_from_user
show_character_movies(character)
