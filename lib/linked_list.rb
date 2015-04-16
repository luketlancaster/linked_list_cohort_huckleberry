require_relative 'linked_list_item'

class LinkedList
  attr_reader :first_item


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

  def size
    count = 0
    if @first_item.nil?
      return count
    end

    if @first_item == @last_item
      count += 1
      return count
    end

    @next_item = @first_item

    while @next_item.next_item.nil? == false
      @next_item = @next_item.next_item
      count += 1
      if @next_item.next_item.nil?
        count += 1
        return count
      end
    end

    if @next_item.next_item.nil?
      return count
    end
  end

  def last
    if @first_item.nil?
      return nil
    end

    if @first_item.nil? == false
      return @last_item.payload
    end
  end

  def to_s
    base = "| |"
    if @first_item.nil?
      return base
    elsif @first_item == @last_item
      return "| #{@first_item.payload} |"
    else

    end
  end


end
