require_relative './author'
require_relative '../data/authors_crud'

module AuthorsList
  def list_authors
    if @authors.empty?
      puts 'You don\'t have any games.'
    else
      @authors.each_with_index do |author, index|
        puts "#{index} first_name: #{author.first_name}, last_name: #{author.last_name}"
        puts ''
      end
    end
    puts ''
  end
end
