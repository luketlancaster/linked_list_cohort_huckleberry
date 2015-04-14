class LinkedListItem
  include Comparable
  attr_reader :payload, :next_item, :name

  def initialize(payload)
    @payload = payload
  end

  def next_item=(next_item)
    if next_item == self
      raise ArgumentError, "Can't set self as next item"
    else
      @next_item = next_item
    end
  end

  def last?
    if self.next_item == nil
      return true
    else
      return false
    end
  end

  def <=>(other)
    self.payload <=> other.payload
  end

  def ===(item)
    self.equal?(item)
  end

end
