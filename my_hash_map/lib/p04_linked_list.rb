class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head, :tail, :count
  
  def initialize
    @head = Node.new
    @tail = Node.new 
    @head.next = @tail
    @tail.prev = @head
    @count = 0
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    count == 0
  end

  def get(key)
    temp = head
    while temp != tail
      if temp.key == key
        return temp.val
      end
      temp = temp.next
    end
    nil
  end

  def include?(key)
    temp = head
    while temp != tail
      if temp.key == key
        return true
      end
      temp = temp.next
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = tail.prev
    next_node = tail
    new_node.next = next_node
    tail.prev.next = new_node
    tail.prev = new_node
    self.count += 1
  end

  def update(key, val)
    temp = head
    while temp != tail
      if temp.key == key
        temp.val = val
      end
      temp = temp.next
    end
  end

  def remove(key)
    temp = head
    while temp != tail
      if temp.key == key
        temp.prev.next = temp.next
        temp.next.prev = temp.prev
      end
      temp = temp.next
    end
  end

  def each(&prc)
    temp = head.next
    while temp != tail
      prc.call(temp)
      temp = temp.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
