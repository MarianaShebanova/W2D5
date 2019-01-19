class HashSet
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    if !include?(key)
      self[key] << key
      self.count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      self.count -= 1
    end
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
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
