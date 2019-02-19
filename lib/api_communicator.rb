require_relative "../lib/command_line_interface.rb"

require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
response_string = RestClient.get('http://www.swapi.co/api/people/')
response_hash = JSON.parse(response_string)
film_titles_array =[]
  response_hash["results"].each do |element|
    if element["name"].downcase.include?(character_name)
      element["films"].each do |filmurl|
        film_titles_hash = {}
        response = RestClient.get(filmurl)
        hash = JSON.parse(response)
        film_titles_hash[:title] = hash["title"]
        film_titles_hash[:director] = hash["director"]
        film_titles_hash[:release] = hash["release_date"]
        film_titles_array << film_titles_hash
      end
    end
  end
return film_titles_array
end


def print_movies(films)
  films.each do |element|
    puts "*" * 20
    puts "Title: #{element[:title]}"
    puts "Director: #{element[:director]}"
    puts "Release Date: #{element[:release]}"
  end
end

def show_character_movies(character)
films = get_character_movies_from_api(character)
  if films.instance_of? Array
    puts "Sorry, no character found!"
  else
    print_movies(films)
  end
end
