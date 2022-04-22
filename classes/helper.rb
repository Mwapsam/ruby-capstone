module Help
  def add_all_items(list)
    list.each do |item|
      add_item(
        Item.new(item['id'], item['publish_date'])
      )
    end
  end

  def clear_items
    @items.clear
  end

  def shallow_copy
    copy = clone
    copy.clear_items
    clone
  end
end
