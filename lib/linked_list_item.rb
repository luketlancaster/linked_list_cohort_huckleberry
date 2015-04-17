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
    if self.payload.class == other.payload.class
      self.payload.to_s <=> other.payload.to_s
    else
      self.payload.class.to_s <=> other.payload.class.to_s
    end
  end

  def ===(item)
    self.equal?(item)
  end

  def payload=(new_payload)
    @payload = new_payload
  end

end
