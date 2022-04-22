require_relative '../classes/author'

describe Author do
  it 'adds an item to the author' do
    author = Author.new('first_name', 'last_name')
    item = double('item')
    allow(item).to receive(:add_author)
    author.add_item item
    count = author.items.count
    expect(count).to eq 1
  end
end
