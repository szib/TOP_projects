class Hash
  # Implementing of method #<< for hashs
  # Uses in method #my_select
  def << (el)
    self[el[0]] = el[1]
  end
end

module Enumerable
  def my_each
    if block_given?
      for x in self
        yield(x)
      end
      self
    else
      to_enum(:my_each)
    end
  end

  def my_each_with_index
    if block_given?
      idx = 0
      for x in self
        yield(x, idx)
        idx += 1
      end
      self
    else
      to_enum(:my_each_with_index)
    end
  end

  def my_select
    if block_given?
      r = self.dup
      r.clear
      self.my_each { |i| r << i if yield(i) }
      r
    else
      to_enum(:my_select)
    end
  end

  def my_all?
    if block_given?
      self.my_each { |i| return false unless yield(i) }
      true
    else
      to_enum(:my_all?)
    end
  end

  def my_any?
    if block_given?
      self.my_each { |i| return true if yield(i) }
      false
    else
      to_enum(:my_any?)
    end
  end

  def my_none?
    if block_given?
      self.my_each { |i| return false if yield(i) }
      true
    else
      to_enum(:my_none?)
    end
  end

  def my_count
    if block_given?
      count = 0
      self.my_each { |i| count += 1 if yield(i) }
      count
    else
      self.count
    end
  end

  def my_map
    m = []
    if block_given?
      self.my_each { |i| m << yield(i) }
      m
    else
      to_enum(:my_map)
    end
  end


end # MODULE
