require_relative './app/app'

def menu
  puts
  puts 'Please choose an option by entering a number'

  options = [
    'List all the books',
    'List all the music albums',
    'List all the games',
    'List all the genres',
    'List all the labels',
    'List all the authors',
    'Add a book',
    'Add a music album',
    'Add a game',
    'Add a genre',
    'Add an label',
    'Add a author',
    'Exit'
  ]

  options.each_with_index do |option, index|
    puts "#{index + 1} - #{option}"
  end
end

def console_start
  app = App.new
  app.welcome

  while menu
    selected = gets.chomp.to_i
    case selected
    when 1
      puts 'app.list_books'
    when 2
      puts 'app.list_music_albums'
    when 3
      puts 'app.list_games'
    when 4
      puts 'app.list_genres'
    when 5
      puts 'app.list_labels'
    when 6
      puts 'app.list_authors'
    when 7
      puts 'app.add_book'
    when 8
      puts 'app.add_music_albums'
    when 9
      puts 'app.add_games'
    when 10
      puts 'app.add_movie'
    when 13
      puts 'Thank youu for usinf our app!'
      break
    else
      puts 'Please choose an appropriate number'
    end
  end
end

def main
  console_start
end

main
