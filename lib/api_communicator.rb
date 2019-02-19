require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  # puts ("hello")
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  # puts ("hello")

  response_hash = JSON.parse(response_string)
  # puts ("hello")

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  character = response_hash["results"].find do|character| 
    character["name"].downcase == character_name
  end
  if character
    character['films']
  else
    "no films"
  end

end

def get_film_info(film)
    film_string = RestClient.get(film)
    film_hash = JSON.parse(film_string)
    film_hash["title"]
end


def print_movies(films)
  films.each do |film_url|
    title = get_film_info(film_url)
    puts title
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  if films != "no films"
    print_movies(films)
  else
    puts ("There are no star wars films with that character")
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
