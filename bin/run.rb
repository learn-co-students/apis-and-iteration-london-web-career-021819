#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/first_option.rb"


def main

  system("clear")

  welcome
  option = options

  case option
  when 1
    display_movies
  when 2
    character = get_character_from_user
    show_character_movies(character)
  else
    puts "Wrong option, try again"
    sleep 2
    main
  end
end

main
