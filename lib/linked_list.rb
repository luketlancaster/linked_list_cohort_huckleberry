class LinkedList

  def get(nth_item)
    if nth_item < 0
      raise IndexError, "Index cannot be a negative number"
    elsif nth_item == 0
      @first_item.payload
    else
      count = 0
      current_node = @first_item
      while count < nth_item
        if current_node.nil?
          raise IndexError, "This index does not exist"
        else
        current_node = current_node.next_item
        count += 1
        end
      end
      current_node.payload
    end
  end

  def push(payload)
    if @first_item.nil?
      @first_item = LinkedListItem.new(payload)
      @last_item = @first_item
    else
      @last_item.next_item = LinkedListItem.new(payload)
      @last_item = @last_item.next_item
    end

  end


end
