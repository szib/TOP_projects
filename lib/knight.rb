

class ChessNode
  attr_accessor :coords, :parent
  def initialize(coords, parent = nil)
    @coords = coords
    @parent = parent
  end

  def self.buildpath(start, finish)
    return nil unless start.zip(finish).flatten.all? { |x| x.between?(0, 7) }
    moves = [-2, -1, 1, 2].permutation(2).to_a.keep_if { |x| x[0].abs != x[1].abs }
    head = ChessNode.new(start)
    q = [head]
    until q.empty?
      cur = q.shift
      p = moves.map { |move| cur.coords.zip(move).map { |m| m.inject(:+) } }
               .select { |x| x[0].between?(0, 7) && x[1].between?(0, 7) }
               .each { |x| q.push(ChessNode.new(x, cur)) }
      return cur if p.include?(finish)
    end
  end

  def self.knight_moves(start, finish)
    p = [finish]
    node = buildpath(start, finish)
    until node.coords == start
      p.unshift(node.coords)
      node = node.parent
    end
    p.unshift(start)
    p
  end
end
