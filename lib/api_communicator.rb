require 'rest-client'
require 'json'
require 'pry'

def return_array_films hash_from_json
    hash_from_json["results"][0]["films"]
end


def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get("https://swapi.co/api/people/?search=#{character_name}")
  response_hash = JSON.parse(response_string)

  # binding.pry

  if response_hash["count"] == 0; return "Err"; end

  film_urls = return_array_films(response_hash)

  char_movies = []
  film_urls.each_with_index do |url, index|
    resp_hash = JSON.parse(RestClient.get(url))
    char_movies.push(resp_hash["title"])
  end

  char_movies
end

def print_movies(films)
  puts "Character not found" if films == "Err"
  return if films == "Err"
  films.each_with_index { |film, index| puts "#{index+1}: #{film}" }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
