require_relative 'lib/hashmap'

test = HashMap.new

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

puts test.length
puts test.get('kite')
test.set('kite', 'blue')
puts test.length
puts test.get('kite')

test.set('moon', 'silver')

puts test.length

puts
puts "test.get('apple') = #{test.get('apple')}"
puts "test.get('banana') = #{test.get('banana')}"
puts "test.get('carrot') = #{test.get('carrot')}"
puts "test.get('dog') = #{test.get('dog')}"
puts "test.get('Joe Biden') = #{test.get('Joe Biden')}"

puts
puts "test.has?('lion') = #{test.has?('lion')}"
puts "test.has?('dog') = #{test.has?('dog')}"
puts "test.has?('jacket') = #{test.has?('jacket')}"
puts "test.has?('Jokowi') = #{test.has?('Jokowi')}"

puts
puts "test.has?('hat') = #{test.has?('hat')}"
puts "test.length = #{test.length}"
puts "test.remove('hat') = #{test.remove('hat')}"
puts "test.length = #{test.length}"

puts "test.has?('hat') = #{test.has?('hat')}"
puts "test.remove('hat') = #{test.remove('hat')}"
puts "test.length = #{test.length}"
puts "test.remove('hat') = #{test.remove('hat')}"
puts "test.length = #{test.length}"

puts
puts "test.keys = #{test.keys}"
puts "test.values = #{test.values}"
puts "test.entries = #{test.entries}"
puts "test.length = #{test.length}"
puts
