class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > 0 && num < store.length
      store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num] 
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store, :num_buckets
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete_if { |el| el == num }
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      resize! if @store.length == count + 1
      @count += 1
      self[num] << num
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete_if { |el| el == num }

      @count -= 1
    end
  end

  def include?(num)
    return true if @store.flatten.include?(num)
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    elements = @store.flatten

    @store = Array.new(2 * @store.length) {Array.new}

    elements.each do |ele|
      @store[ele] << ele
    end
  end
end