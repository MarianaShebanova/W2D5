class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
    @store.map! do |el|
      el = false
    end
  end

  def insert(num) # O(1)
    raise "Out of bounds" if num < 0 || num >= @store.length 
    @store[num] = true
  end

  def remove(num) # O(1)
    raise "Out of bounds" if num < 0 || num >= @store.length
    @store[num] = false
  end

  def include?(num) # O(1)
    raise "Out of bounds" if num < 0 || num >= @store.length
   @store[num]    
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num) # O(1)
    self[num] << num 
  end

  def remove(num) # O(1)
    self[num].delete(num)
  end

  def include?(num) # O(n)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num) #O(n)
    resize! if count == num_buckets
    if !include?(num)
      self[num] << num
      self.count += 1
    end
  end

  def remove(num) # O(n)
    if include?(num)
      self[num].delete(num)
      self.count -= 1
    end
  end

  def include?(num) # O(n)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize! # O(n^2)
    if self.count == num_buckets
      temp = Array.new(num_buckets * 2) { Array.new }
      @store.each do |el1|
        el1.each do |el2|
          temp[el2 % (num_buckets * 2)] << el2
        end
      end
    end
    @store = temp
  end
end
