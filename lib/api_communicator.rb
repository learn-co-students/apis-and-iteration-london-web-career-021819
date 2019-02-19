require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character_name)
  response_string = RestClient.get("http://www.swapi.co/api/people/")
  response_hash = JSON.parse(response_string)
  films = nil
  response_hash["results"].each do |character|
    if character["name"].downcase == character_name.downcase
      return films = character["films"]
    end
  end
  if films == nil
    abort("Invalid character name")
  end
end


def get_movie_names_from_api(films)
  titles = []
  films.each do |film|
    film_response_string = RestClient.get(film)
    film_response_hash = JSON.parse(film_response_string)
    titles << film_response_hash["title"]
  end
  titles
end

def print_movies(titles)
  puts "This character appears in the following films:"
  titles.each_with_index {|name, index| puts "#{index+1}. #{name}"}
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  titles = get_movie_names_from_api(films)
  print_movies(titles)
end
