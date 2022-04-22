require_relative './movie'
require_relative '../data/movies_crud'

module MoviesList
  def list_movies
    if @movies.empty?
      puts 'You don\'t have any movies.'
    else
      @movies.each_with_index do |movie, index|
        puts "#{index}, movie_name: #{movie.movie_name}, published_date: #{movie.published_date}"
        puts ''
      end
    end
    puts ''
  end
end
