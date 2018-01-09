require './lib/search_bin_tree.rb'

describe 'Search binary tree' do
  let(:arr) do
    [4, 6, 2, 3, 5, 7, 8]
  end

  let(:random_arr) do
    Array.new(1000) { rand(10_000) }
  end

  let(:tree) do
    BinTree.build_tree(arr)
  end

  let(:random_tree) do
    BinTree.build_tree(random_arr)
  end

  context 'breath first search' do
    it 'should return an item' do
      expect(BinTree.bfs(6, tree).value).to eq(6)
    end

    it 'should return nil if no success' do
      expect(BinTree.bfs(111, tree)).to eq(nil)
    end
  end

  context 'deep first search' do
    context 'recursive way' do
      it 'should return an item' do
        expect(BinTree.dfs_rec(6, tree).value).to eq(6)
      end

      it 'should return nil if no success' do
        expect(BinTree.dfs_rec(111, tree)).to eq(nil)
      end
    end

    context 'non-recursive way' do
      it 'should return item' do
        expect(BinTree.dfs(6, tree).value).to eq(6)
      end

      it 'should return nil if no success' do
        expect(BinTree.dfs(111, tree)).to eq(nil)
      end
    end
  end

  context 'tree correctness' do
    it 'should left child be lower' do
      random_arr.each do |x|
        n = BinTree.bfs(x, random_tree)
        expect(n.children[0].value).to be < x unless n.children[0].nil?
      end
    end

    it 'should right child be higher or equal' do
      random_arr.each do |x|
        n = BinTree.dfs(x, random_tree)
        expect(n.children[1].value).to be >= x unless n.children[1].nil?
      end
    end
  end
end
