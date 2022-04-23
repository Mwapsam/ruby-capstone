require 'json'
require_relative '../data/book_crud'

def populate_labels
  fetch_data('labels').map do |label|
    Label.new(label['name'], label['color'])
  end
end
