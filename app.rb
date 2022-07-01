require './movie_actions'
require './json/json_manipulation'

class App
  def initialize
    @movie_action = MovieActions.new
    @savejson = Manipulation.new
  end

  def redirection(option)
    case option
    when 3
      @movie_action.list_all_movies
    when 8
      @movie_action.list_all_sources
    when 9
      @movie_action.add_movie
    when 13
      @savejson.save_data(@movie_action.movies, 'movies.json')
      @savejson.save_data(@movie_action.sources, 'sources.json')
    else
      p 'Invalid input'
    end
  end
end
