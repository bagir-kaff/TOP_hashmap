require_relative 'linked_list'
require_relative 'node'
require 'pry-byebug'
class HashMap
  attr_reader :length
  def initialize
    @mod = 16
    @bucket = Array.new(@mod)
    @load_factor = 0.75
    @length = 0
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
    @length += 1
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
      @length -= 1
      return list.remove_at(node_index) if node_index
    end
  end

  def clear
    @bucket = Array.new(@mod)
  end

  def keys
    keys = []

    @bucket.each do |list|
      list_keys = []
      next if list.nil?
      current_node = list.head
      while current_node
        list_keys << current_node.key
        current_node = current_node.next_node
      end
      keys.concat(list_keys)
    end

    return keys
  end


  def values
    values = []

    @bucket.each do |list|
      list_values = []
      next if list.nil?
      current_node = list.head
      while current_node
        list_values << current_node.value
        current_node = current_node.next_node
      end
      values.concat(list_values)
    end

    return values
  end

  def entries
    entries = []
    @bucket.each do |list|
      list_entries = []
      next if list.nil?
      current_node = list.head
      while current_node
        list_entries << [current_node.key, current_node.value]
        current_node = current_node.next_node
      end
      entries.concat(list_entries)
    end
    return entries
  end
end
