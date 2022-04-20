require_relative './book'
require_relative './label'

module Booklist
  def list_books
    if @books.empty?
      puts 'You don\'t have any Books.'
    else
      @books.each_with_index do |book, index|
        puts "#{index} name: #{book.name}, publisher: #{book.publisher}, publish_date:#{book.published_date}"
        puts ''
      end
    end
    puts ''
  end

  def add_book
    print 'Title: '
    name = gets.chomp
    print 'publisher: '
    publisher = gets.chomp
    print 'date of publish: '
    published_date = gets.chomp
    print 'cover state: '
    cover_state = gets.chomp
    label = handle_label
    book = Book.new(publisher, cover_state, name, published_date)
    @labels << label unless @labels.include?(label)
    @books << book
    puts 'Book added successfully'
  end

  def handle_label
    if @labels.any?
      print "enter 'N' to create a new label or 'S' to select an existing one"
      option = gets.chomp.upcase
      case option
      when 'N'
        add_label
      when 'S'
        puts 'select a label from the list by index'
        list_labels
        option = gets.chomp
        @labels[option.to_i]
      else
        print 'invalid entry'
      end
    else
      add_label
    end
  end

  def list_labels
    if @labels.empty?
      puts 'You don\'t have any Labels.'
    else
      @labels.each_with_index do |label, index|
        puts "#{index}) Label: #{label.name} Color: #{label.color}"
      end
    end
  end

  def add_label
    print 'Label Name: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(title: title, color: color)
    @labels << label unless @labels.include?(label)
    puts 'Label added successfully'
  end
end
