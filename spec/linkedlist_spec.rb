require './linkedlist.rb'

describe 'LinkedList' do
  before do
    @list = LinkedList.new
  end

  context 'with an empty list' do
    it 'should has no item at start' do
      expect(@list.head).to eq(nil)
      expect(@list.size).to eq(0)
    end

    it 'should head work' do
      expect(@list.head).to eq(nil)
    end

    it 'should tail work' do
      expect(@list.tail).to eq(nil)
    end

    it 'should size work' do
      expect(@list.size).to eq(0)
    end

    it 'should at(idx) work' do
      expect(@list.at(0)).to eq(nil)
      expect(@list.at(1)).to eq(nil)
      expect(@list.at(-1)).to eq(nil)
    end

    it 'should to_s work' do
      expect(@list.to_s).to eq(nil)
    end

    it 'should pop last item' do
      expect(@list.pop).to eq(nil)
      expect(@list.pop).to eq(nil)
    end

    it 'should contains? work' do
      expect(@list.contains?(6)).to eq(false)
      expect(@list.contains?('se')).to eq(false)
      expect(@list.contains?(nil)).to eq(false)
    end

    it 'should find work' do
      expect(@list.find(6)).to eq(nil)
      expect(@list.find('se')).to eq(nil)
      expect(@list.find(nil)).to eq(nil)
    end
  end

  context 'after appended and prepended' do
    before do
      @list.append(1)
      @list.prepend(2)
      @list.append(3)
      @list.prepend(4)
    end

    it 'should head work' do
      expect(@list.head).to eq(4)
    end

    it 'should tail work' do
      expect(@list.tail).to eq(3)
    end

    it 'should size work' do
      expect(@list.size).to eq(4)
    end

    it 'should at(idx) work' do
      expect(@list.at(0)).to eq(4)
      expect(@list.at(1)).to eq(2)
      expect(@list.at(-1)).to eq(nil)
    end

    it 'should to_s work' do
      expect(@list.to_s).to eq('( 4 ) -> ( 2 ) -> ( 1 ) -> ( 3 )')
    end

    it 'should pop last item' do
      expect(@list.pop).to eq(3)
      expect(@list.pop).to eq(1)
      expect(@list.pop).to eq(2)
      expect(@list.pop).to eq(4)
      expect(@list.pop).to eq(nil)
      expect(@list.pop).to eq(nil)
    end

    it 'should contains? work' do
      expect(@list.contains?(2)).to eq(true)
      expect(@list.contains?(1)).to eq(true)
      expect(@list.contains?(4)).to eq(true)
      expect(@list.contains?(6)).to eq(false)
      expect(@list.contains?('se')).to eq(false)
      expect(@list.contains?(nil)).to eq(false)
    end

    it 'should find work' do
      expect(@list.find(4)).to eq(0)
      expect(@list.find(3)).to eq(3)
      expect(@list.find(6)).to eq(nil)
      expect(@list.find('se')).to eq(nil)
      expect(@list.find(nil)).to eq(nil)
    end
  end
end
