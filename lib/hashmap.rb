require_relative 'linked_list'

class HashMap
  attr_reader :number_of_items
  def initialize
    @bucket = Array.new(16)
    @load_factor = 0.75
    @mod = 16
    @number_of_items = 0
  end

  def hash(key,whatever=nil)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord}
    return hash_code
  end
