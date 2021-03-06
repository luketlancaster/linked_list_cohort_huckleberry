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

ll.size.times do |i|
  print "#{ll.get(i).inspect} -> "
end

print "nil"
