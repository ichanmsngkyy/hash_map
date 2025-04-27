require_relative 'lib/hash_map'

test = HashMap.new(0.75, 16)

# Add initial key-value pairs
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts "Initial length: #{test.length}" # Expecting: 12

# Overwrite values
test.set('apple', 'green')
test.set('banana', 'brown')
test.set('carrot', 'purple')
test.set('dog', 'golden')

# Verify updates
puts test.get('apple')     # Expecting: green
puts test.get('banana')    # Expecting: brown
puts test.get('carrot')    # Expecting: purple
puts test.get('dog')       # Expecting: golden
puts "Length after overwriting: #{test.length}" # Expecting: 12 (unchanged)

puts test.values.inspect # Expecting: ["red", "yellow"]

50.times { |i| test.set("key#{i}", "value#{i}") }

puts "Capacity after expansion: #{test.capacity}" # Expecting capacity to grow (e.g., 32 or 64)
puts "Length after expansion: #{test.length}" # Expecting: 52 (50 + 2)
puts "Load factor: #{test.length.to_f / test.capacity}" # Expecting below 0.75

# Check bucket distribution
test_buckets = test.instance_variable_get(:@buckets)
test_buckets.each_with_index do |bucket, index|
  puts "Bucket #{index}: #{bucket&.size || 0} entries"
end
