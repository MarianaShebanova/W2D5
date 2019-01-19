class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0
    each_with_index do |el, i|
      hash ^= el.to_s.ord() * i 
    end
    hash 
  end
end

class String
  def hash
    hash = 0
    chars.each_with_index do |el, i|
      hash ^= el.to_s.ord() * i 
    end
    hash.hash 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.hash
  end
end
