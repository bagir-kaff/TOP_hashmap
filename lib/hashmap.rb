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

  def check_entries_number
    expand_hashmap  if @length > @mod * @load_factor
  end

  def expand_hashmap
    @mod *= 2
    temp_bucket = Array.new(@mod)
    @bucket.each do |list|
      next if list.nil?
      current_node = list.head
      while current_node
        index = hash(current_node.key) % @mod
        temp_bucket[index] = LinkedList.new if temp_bucket[index].nil?
        temp_bucket[index].prepend(current_node.key, current_node.value)
        current_node = current_node.next_node
      end
    end
    @bucket = temp_bucket
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    return hash_code
  end



  def set(key,value)
    index = hash(key) % @mod

    @bucket[index] = LinkedList.new if @bucket[index].nil?

    node = @bucket[index].find_node_by_key(key)
    if node.nil?
      @bucket[index].prepend(key,value) #using #prepend instead of #append because it is O(1) , faster
      @length += 1
      check_entries_number
    else
      node.value = value
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
      if node_index
        removed_value =  list.remove_at(node_index)
        @length -= 1
      end
    end
    return removed_value
  end

  def clear
    @bucket = Array.new(@mod)
    @length = 0
    @mod = 16
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

#tinggal size expansion, klo udh ini hapus aja
