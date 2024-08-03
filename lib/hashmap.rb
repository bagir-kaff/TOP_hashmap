require_relative 'linked_list'
require_relative 'node'
require 'pry-byebug'
class HashMap
  attr_reader :number_of_items
  def initialize
    @bucket = Array.new(16)
    @load_factor = 0.75
    @mod = 16
    @number_of_items = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    return hash_code
  end

  def set(key,value)
    index = hash(key) % @mod
    if @bucket[index].nil?
      @bucket[index] = LinkedList.new
      @bucket[index].prepend(key,value)
    else
      node = @bucket[index].find_node_by_key(key)
      if node.nil?
        @bucket[index].prepend(key,value) #using #prepend instead of #append because it is O(1) , faster
      else
        node.value = value
      end
    end
  end

  def get(key)
    index = hash(key) % @mod
    if list = @bucket[index]
      node = list.find_node_by_key(key)
      return node.value if node != nil
    end
    return nil
  end

  def has?(key)
    index = hash(key) % @mod
    if list = @bucket[index]
      return list.contains_key?(key)
    end
  end

  def remove(key)
    index = hash(key) % @mod
    if list = @bucket[index]
      node_index = list.find_index_by_key(key)
      return list.remove_at(node_index) if node_index
    end
  end

  
end
