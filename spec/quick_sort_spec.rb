require './lib/quick_sort.rb'

describe 'Quicksort' do
  before do
    @arr = [4, 6, 2, 3, 5, 7, 8]
    @random_arr = Array.new(1000) { rand(10_000) }
  end

  it 'should sort the array quickly :)' do
    expect(@arr.quick_sort).to eq(@arr.sort)
  end

  it 'should sort a random array quickly :)' do
    expect(@random_arr.quick_sort).to eq(@random_arr.sort)
  end

  it 'should work as class method' do
    expect(Array.quick_sort(@random_arr)).to eq(@random_arr.sort)
  end
end
