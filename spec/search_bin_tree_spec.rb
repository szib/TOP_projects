require './search_bin_tree.rb'

describe 'Search binary tree' do
  before do
    @arr = [4, 6, 2, 3, 5, 7, 8]
    @random_arr = Array.new(1000) { rand(10_000) }
    @tree = BinTree.build_tree(@arr)
    @random_tree = BinTree.build_tree(@random_arr)
  end

  it 'should bfs return item' do
    expect(BinTree.bfs(6,@tree).value).to eq(6)
  end

  it 'should bfs return nil if no success' do
    expect(BinTree.bfs(111,@tree)).to eq(nil)
  end

  it 'should dfs return item' do
    expect(BinTree.dfs(6,@tree).value).to eq(6)
  end

  it 'should dfs return nil if no success' do
    expect(BinTree.dfs(111,@tree)).to eq(nil)
  end

  it 'should dfs_rec return item' do
    expect(BinTree.dfs_rec(6,@tree).value).to eq(6)
  end

  it 'should dfs_rec return nil if no success' do
    expect(BinTree.dfs_rec(111,@tree)).to eq(nil)
  end

  it 'should left child be lower' do
    @random_arr.each do |x|
      n = BinTree.bfs(x,@random_tree)
      expect(n.children[0].value).to be < x unless n.children[0].nil?
      n = BinTree.dfs(x,@random_tree)
      expect(n.children[0].value).to be < x unless n.children[0].nil?
      n = BinTree.dfs_rec(x,@random_tree)
      expect(n.children[0].value).to be < x unless n.children[0].nil?
    end
  end

  it 'should right child be higher or equal' do
    @random_arr.each do |x|
      n = BinTree.bfs(x,@random_tree)
      expect(n.children[1].value).to be >= x unless n.children[1].nil?
      n = BinTree.dfs(x,@random_tree)
      expect(n.children[1].value).to be >= x unless n.children[1].nil?
      n = BinTree.dfs_rec(x,@random_tree)
      expect(n.children[1].value).to be >= x unless n.children[1].nil?
    end
  end

end
