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


end # MODULE
