require './lib/knight.rb'

describe 'Knight moves' do
  @data = [
    [[[0, 0], [1, 2]], [[0, 0], [1, 2]]],
    [[[0, 0], [3, 3]], [[0, 0], [1, 2], [3, 3]]],
    [[[3, 3], [0, 0]], [[3, 3], [1, 2], [0, 0]]]
  ]

  @data.each do |d|
    it "should return #{d[1].inspect} for #{d[0].inspect}" do
      expect(ChessNode.knight_moves(d[0][0], d[0][1])).to match_array(d[1])
    end
  end
end
