class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize(value = nil)
    @head = if value.nil?
              nil
            else
              Node.new(value)
            end
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      n = @head
      n = n.next_node until n.next_node.nil?
      n.next_node = Node.new(value)
    end
  end

  def prepend(value)
    n = Node.new(value, @head)
    @head = n
  end

  def head
    return @head.value unless @head.nil?
    nil
  end

  def tail
    return nil if @head.nil?
    n = @head
    n = n.next_node until n.next_node.nil?
    n.value
  end

  def at(idx)
    return nil if @head.nil?
    c = 0
    n = @head
    return nil if idx < 0 || idx >= size
    until c == idx
      n = n.next_node
      c += 1
    end
    n.value
  end

  def pop
    return nil if @head.nil?
    n = @head
    until n.next_node.nil?
      prev = n
      n = n.next_node
    end
    if prev.nil?
      v = @head.value
      @head = nil
    else
      v = n.value
      prev.next_node = nil
    end
    v
  end

  def contains?(value)
    return false if @head.nil?
    return true if @head.value == value
    n = @head
    until n.next_node.nil?
      return true if n.value == value
      n = n.next_node
    end
    n.value == value
  end

  def find(value)
    return nil if @head.nil?
    c = 0
    n = @head
    until n.next_node.nil? || n.value == value
      n = n.next_node
      c += 1
    end
    return nil unless n.value == value
    c
  end

  def size
    return 0 if @head.nil?
    n = @head
    c = 1
    until n.next_node.nil?
      c += 1
      n = n.next_node
    end
    c
  end

  def to_s
    return nil if @head.nil?
    n = @head
    a = [@head.value]
    until n.next_node.nil?
      n = n.next_node
      a.push(n.value)
    end
    a.map { |x| "( #{x} )" }.join(' -> ')
  end
end
