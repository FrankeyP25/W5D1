class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # new_hash = {}
    # self.each_with_index do |el,i|
    #   new_hash[i] = el.hash
    # end
    # new_hash
    arr = self.map do |el|
      el.hash
    end
    arr1 = arr.map.with_index do |el, i|
      el * i
    end
    arr1.sum
  end
end


class String
  #{a = "22", b = "43"}
  def hash
    # new_hash = {}
    # self.each_char.with_index do |ch, i|
    #   new_hash[ch] = i
    # end
    # new_hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
