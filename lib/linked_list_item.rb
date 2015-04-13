class LinkedListItem
  include Comparable
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def next_item
    @next_item
  end

end
