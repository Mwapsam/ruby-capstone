require_relative './book'
require_relative './label'
require_relative '../data/book_crud'
require_relative '../data/label_crud'
require 'pry'

module Booklist
  def list_books
    if @books.empty?
      puts 'You don\'t have any Books.'
    else
      @books.each_with_index do |book, index|
        puts "#{index} Title: #{book.name}, Publisher: #{book.publisher}, Publish_date:#{book.published_date},
        Cover State: #{book.cover_state}"
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
    stored_books = fetch_data('books')
    handle_label
    book = Book.new(publisher, cover_state, name, published_date)
    @books << book
    book_data = { name: name, publisher: publisher, published_date: published_date,
                  cover_state: cover_state }
    stored_books.push(book_data)
    update_data('books', stored_books)
    puts 'Book added successfully'
  end

  def handle_label
    if @labels.any?
      print "enter 'N' to create a new label or 'S' to select an existing one from the list: "
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


  def add_label
    print 'Label Name: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    stored_label = fetch_data('labels')
    label = Label.new(title, color)
    @labels << label unless @labels.include?(label)
    @labels << label
    label_data = { title: title, color: color }
    stored_label.push(label_data)
    update_data('labels', stored_label)
    puts 'Label added successfully'
  end

  def list_labels
    if @labels.empty?
      puts 'You don\'t have any Labels.'
    else
      @labels.each_with_index do |label, index|
        puts "#{index} Name: #{label.title}, Color: #{label.color}"
        puts ''
      end
    end
  end
end
