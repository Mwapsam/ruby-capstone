require_relative('../classes/movie')
require 'date'

describe Movie do
  it 'a movie should be archived if it as was published more than 10 years ago' do
    movie = Movie.new('Silicon valley', DateTime.parse('2000-01-01'))
    movie.move_to_archive

    expect(movie.archived).to be true
  end
end
