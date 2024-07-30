
class LinkedList
  attr_accessor :head
  attr_reader :size
  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    if head==nil
      self.head = Node.new(value)
    else
      current = head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = Node.new(value)
    end
    @size += 1
  end

  def prepend(value)
    input_node = Node.new(value)
    input_node.next_node = head
    self.head = input_node
    @size += 1
  end

  def size
    @size
  end

  def at(index) #returns node, returns nil if the input is out of reach
    if index<0
      return nil if -index > @size
      return at(@size + index)
    end
    return nil if index >= size
    current = head
    (0...index).step { |i| current = current.next_node }
    return current
  end

  def pop
    removed_node = at(@size-1)
    at(@size-2).next_node = nil
    @size
    return removed_node
  end

  def contains?(value)
    current = head
    while current != nil
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value) #returns index, returns nil if the input is out of reach
    current = head
    count = 0
    while current != nil
      return count if current.value == value
      count += 1
      current = current.next_node
    end
    return nil
  end

  def find_node(value)  #returns node, returns nil if the input is out of reach
    current = head
    while current != nil
      return current if current.value == value
      current = current.next_node
    end
    return nil
  end

  def to_s
    str = ""
    current = self.head
    while current != nil
      str << "#{current.value} -> "
      break if current.next_node == nil
      current = current.next_node
    end
    return str<<'nil'
  end

  def insert_at(value,index)
    input_node = Node.new(value)
    if index == 0
      input_node.next_node = @head
      @head = input_node
    elsif index < 0
      return if -index > @size
      index = index+@size+1
      input_node.next_node = at(index)
      at(index-1).next_node = input_node
    elsif index > @size
      append(value)
      return
    else
      input_node.next_node = at(index)
      at(index-1).next_node = input_node
    end
    @size+=1
  end

  def remove_at(index)
    return nil if size == 0
    removed_node = nil  #for future use
    if index == 0
      removed_node = @head
      @head = @head.next_node
    elsif index < 0
      return nil if -index>@size
      return remove_at(index+@size) #not easy to read , but good enough
    elsif index > @size
      return nil
    else
      removed_node = at(index)
      at(index-1).next_node = at(index+1)
    end
    @size-=1
    return removed_node.value 
  end

end
