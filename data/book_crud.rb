require 'json'

def store_book_data(book)
  book_data = {
    name: book.name,
    published_date: book.published_date.to_i,
    archived: book.archived,
    cover_state: book.cover_state,
    id: book.id,
    label_id: book.label.id
  }
  File.write('./data/books.json', JSON.generate(book_data), mode: 'w')
end

def load_books
  books_json = File.read('./data/books.json')
  books_data = []
  labels_data = load_labels
  if books_json.empty?
    books_data
  else
    JSON.parse(books_json).each do |book|
      book_item = Book.new(book['name'], Time.at(book['published_date']),
                           book['archived'], book['cover_state'], book['id'])
      labels_data.each do |label|
        book_item.label = label if label.id == book['label_id']
      end
      books_data.push(book_item)
    end
  end
  books_data
end
