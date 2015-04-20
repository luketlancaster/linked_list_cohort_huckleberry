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

  def []=(index, new_payload)
    current_node = first_item
    index.times do
      current_node = current_node.next_item
    end
    current_node.payload = new_payload
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
