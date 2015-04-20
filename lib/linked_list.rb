require_relative 'linked_list_item'

class LinkedList
  attr_accessor :first_item
  attr_reader :size

  def initialize(*payload)
    @size = 0
    unless payload.empty?
      payload.each do |load|
        self.push(load)
      end
    end
  end

  def get(index)
    raise IndexError if index < 0 or index > self.size
    if index == 0
      @first_item.payload
    else
      current_node = @first_item
      index.times do
        current_node = current_node.next_item
      end
      current_node.payload
    end
  end

  def [](index)
    self.get(index)
  end

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
    if index == 0
      @first_item = current_node.next_item
    end
    if index >0
      index -= 1
      index.times do
        current_node = current_node.next_item
      end
      if current_node.nil?
        raise IndexError
      end
      current_node.next_item = current_node.next_item.next_item
    end
    @size = self.size - 1
  end

  def size
    @size
  end

  def last
    unless @last_item.nil?
      @last_item.payload
    end
  end

  def to_s
    base = "| "
    if @first_item.nil?
      "| |"
    else
     size.times do |i|
      base << "#{get(i)}, "
    end
     base.sub!(/, (?!.*, )/, " |")
     base
    end
  end

end
