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
    self.payload.to_s <=> other.payload.to_s
  end

  def >(other)
    if self.payload.class == Symbol
      (self.payload.class == Symbol) <=> (other.payload.class != Symbol)
    else
      self.payload.to_s <=> other.payload.to_s
    end
  end

  def <(other)
    if self.payload.class == Symbol and other.payload.class != Symbol
      (self.payload.class == Symbol) <=> (other.payload.class != Symbol)
    elsif self.payload.class == Symbol and other.payload.class == Symbol
      self.payload <=> other.payload
    else
      self.payload.to_s <=> other.payload.to_s
    end
  end

  def ===(item)
    self.equal?(item)
  end

end
