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

  def add_movie
    print 'Enter movie name'
    movie_name = gets.chomp
    print 'Enter Published date '
    published_date = gets.chomp

    movies_data = Movie.new(movie_name, published_date)
    @movies.push(movies_data)
    save_movies(@movies)

    puts 'movie saved successfully!'
  end
end
