require_relative 'linked_list_item'

class LinkedList
  attr_reader :first_item
  attr_reader :size

  def initialize(*payloads)
    @size = 0
    unless payloads.empty?
      payloads.each do |payload|
        push(payload)
      end
    end
  end

  def get_item(index)
    raise IndexError if index < 0 or index > size
    if index == 0
      @first_item
    else
      current_node = @first_item
      index.times do
        current_node = current_node.next_item
      end
      current_node
    end
  end

  def get(index)
    get_item(index).payload
  end

  alias [] get

  def []=(index, payload)
    if index == 0
      current_item = @first_item
    else
      previous_item = get_item(index - 1)
      current_item = previous_item.next_item
    end

    new_item = LinkedListItem.new(payload)
    next_item = current_item.next_item
    new_item.next_item = next_item

    if index == 0
      @first_item = new_item
    else
      previous_item.next_item = new_item
    end
  end

  def index(payload)
    count = 0
    current_item = @first_item
    return nil if @first_item.nil?
    while current_item.nil? == false and current_item.payload != payload
      current_item = current_item.next_item
      count += 1
    end
    if current_item.nil?
      return nil
    end
    count
  end

  def push(payload)
    new_item = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = new_item
    else
      @last_item.next_item = new_item
    end
    @size += 1
    @last_item = new_item
  end

  def delete(index)
    current_node = first_item
    @first_item = current_node.next_item if index.equal?(0)
    if index > 0
      index -= 1
      index.times {current_node = current_node.next_item}
      if current_node.nil?
        raise IndexError
      else
        current_node.next_item = current_node.next_item.next_item
      end
    end
    @size -= 1
  end

  def last
    unless @last_item.nil?
      @last_item.payload
    end
  end

  def sorted?
    if size < 2
      true
    elsif @first_item == @first_item.next_item
      true
    elsif @first_item > @first_item.next_item
      false
    elsif @first_item < @first_item.next_item
      true
    end
  end

  def to_s
    base = "| "
    if @first_item.nil?
      base << "|"
    else
     size.times do |i|
      base << "#{get(i)}, "
    end
     base.sub!(/, (?!.*, )/, " |")
     base
    end
  end

end
