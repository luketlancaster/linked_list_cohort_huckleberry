class LinkedList
  attr_accessor :payload
  attr_accessor :node
  attr_accessor :first_item
  attr_accessor :next_item

  def push(payload)
    if @first_item.nil?
      lli = LinkedListItem.new(payload)
      @first_item = lli.payload
      lli.next_item = nil
    else
      lli = LinkedListItem.new(payload)
      @node = lli.payload
      lli.next_item = nil
    end

  end

  def get(node_value)
    return first_item if node_value == 0
    return @node if node_value == 1
  end

end
