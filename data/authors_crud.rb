require 'json'
require_relative '../classes/author'

def load_authors
  authors_json = File.read('./data/authors.json')
  authors_data = []
  if authors_json.empty?
    authors_data
  else
    JSON.parse(authors_json).each do |json|
      authors_data << Author.from_json(json)
    end
  end
  authors_data
end
