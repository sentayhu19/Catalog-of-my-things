require './movie_actions'

class App
  def initialize
    @movie_action = MovieActions.new
  end

  def redirection(option)
    case option
    when 3
      @movie_action.list_all_movies
    when 8
      @movie_action.list_all_sources
    when 9
      @movie_action.add_movie
    else
      p 'Invalid input'
    end
  end
end
