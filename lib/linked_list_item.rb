class LinkedListItem
  include Comparable
  attr_reader :payload
  attr_reader :next_item

  def initialize(payload)
    @payload = payload
  end

  def next_item=(lli)
    raise ArgumentError if lli == self
    @next_item = lli
  end

  def last?
    next_item.nil?
  end

  def <=>(other)
    self.payload <=> other.payload
  end

  def ===(item)
    self.equal?(item)
  end

end
