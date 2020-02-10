require 'rest-client'
require 'json'
require 'pry'

BASE_URL = 'http://www.swapi.co/api/'

# def create_Character_url(character_name)
#   if character_name.include?(" ")
#     url = BASE_URL + "people/?search=" + character_name.gsub!(" ", "+")
#   else
#     url = BASE_URL + character_name
#   end
#   return url
# end

# def create_Film_url(film)
#   url = BASE_URL + "films/?search=" + character_name.gsub!(" ", "+")
# end

# # iterate over the response hash to find the collection of `films` for the given
#   #   `character`
# def iterate_response(response_hash)
#   response_hash["results"].map{|character|
#     character["films"]
# }
# end
#   # collect those film API urls, make a web request to each URL to get the info
#   #  for that film
#   def make_Get_Film_request(url)
#     film_response = RestClient.get(iterate_response(response_hash)[0][1])
#   end



def get_character_movies_from_api(character_name)
  #make the web request
  response = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response)
  character_data = response_hash["results"].find { |character| character["name"] == character_name}
  film_url = character_data["films"]
  film_data = film_url.collect { |film| JSON.parse(RestClient.get(film))}
  return film_data
  # film_response = RestClient.get(iterate_response(response_hash)[0][1])
  # film_hash = JSON.parse(film_response)
  # p film_hash["title"]

  
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  x = films.map{ |character| character["title"]}
  puts x
  
  
  # this collection will be the argument given to `print_movies`
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
