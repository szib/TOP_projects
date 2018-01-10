require './lib/quick_sort.rb'

describe 'Quicksort' do
  context 'with not random array' do
    let(:arr) do
      [4, 6, 2, 3, 5, 7, 8]
    end
    it 'should sort the array quickly :)' do
      expect(arr.quick_sort).to eql(arr.sort)
    end

    it 'should work as class method' do
      expect(Array.quick_sort(arr)).to eql(arr.sort)
    end
  end

  context 'with not random array' do
    let(:random_arr) do
      Array.new(1000) { rand(10_000) }
    end

    it 'should sort a random array quickly :)' do
      expect(random_arr.quick_sort).to eql(random_arr.sort)
    end
  end
end
