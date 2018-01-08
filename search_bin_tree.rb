class BinTree
  # children[0] => left
  # children[1] => right
  attr_accessor :value, :parent, :children

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def self.build_tree(arr)
    head = BinTree.new(arr[0])
    1.upto(arr.length - 1) do |x|
      hang_onto_the_tree(arr[x], head)
    end
    head
  end

  def self.hang_onto_the_tree(item, cmp)
    child = item < cmp.value ? 0 : 1
    if cmp.children[child].nil?
      cmp.children[child] = BinTree.new(item, cmp)
    else
      hang_onto_the_tree(item, cmp.children[child])
    end
  end

  def self.bfs(value, head)
    stack = [head]
    until stack.empty?
      i = stack.shift
      return i if i.value == value
      stack.push(i.children[1]) unless i.children[1].nil?
      stack.push(i.children[0]) unless i.children[0].nil?
    end
    nil
  end

  def self.dfs(value, head)
    stack = [head]
    until stack.empty?
      i = stack.pop
      return i if i.value == value
      stack.push(i.children[1]) unless i.children[1].nil?
      stack.push(i.children[0]) unless i.children[0].nil?
    end
    nil
  end

  def self.dfs_rec(value, head)
    return nil if head.nil?
    return head if head.value == value
    return dfs_rec(value, head.children[0]) || dfs_rec(value, head.children[1])
  end

end
