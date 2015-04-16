#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in as an array

# Now, build a LinkedList
ll = LinkedList.new

# And, populate it

payloads.each do |payload|
  ll.push(payload)
end

# Then, print it out

print "* -> "




if ll.size > 0
  print "#{ll.get(0).inspect} -> "
end
if ll.size > 1
  print "#{ll.get(1).inspect} -> "
end
if ll.size > 2
  print "#{ll.get(2).inspect} -> "
end
if ll.size > 3
  print "#{ll.get(3).inspect} -> "
end
if ll.size > 4
  print "#{ll.get(4).inspect} -> "
end
if ll.size > 5
  print "#{ll.get(5).inspect} -> "
end



print "nil"
