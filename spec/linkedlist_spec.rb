require './lib/linkedlist.rb'

describe LinkedList do
  context 'with an empty list' do
    let(:emptylist) do
      LinkedList.new
    end

    it 'should has no item at start' do
      expect(emptylist.head).to be_nil
      expect(emptylist.size).to eql(0)
    end

    it 'should head work' do
      expect(emptylist.head).to be_nil
    end

    it 'should tail work' do
      expect(emptylist.tail).to be_nil
    end

    it 'should size work' do
      expect(emptylist.size).to eql(0)
    end

    it 'should at(idx) work' do
      expect(emptylist.at(0)).to be_nil
      expect(emptylist.at(1)).to be_nil
      expect(emptylist.at(-1)).to be_nil
    end

    it 'should to_s work' do
      expect(emptylist.to_s).to be_nil
    end

    it 'should pop last item' do
      expect(emptylist.pop).to be_nil
      expect(emptylist.pop).to be_nil
    end

    it 'should contains? work' do
      expect(emptylist.contains?(6)).to be false
      expect(emptylist.contains?('se')).to be false
      expect(emptylist.contains?(nil)).to be false
    end

    it 'should find work' do
      expect(emptylist.find(6)).to be_nil
      expect(emptylist.find('se')).to be_nil
      expect(emptylist.find(nil)).to be_nil
    end
  end

  context 'after appended and prepended' do
    let(:list) do
      list = LinkedList.new
      list.append(1)
      list.prepend(2)
      list.append(3)
      list.prepend(4)
      return list
    end

    it 'should head work' do
      expect(list.head).to eql(4)
    end

    it 'should tail work' do
      expect(list.tail).to eql(3)
    end

    it 'should size work' do
      expect(list.size).to eql(4)
    end

    it 'should at(idx) work' do
      expect(list.at(0)).to eql(4)
      expect(list.at(1)).to eql(2)
      expect(list.at(-1)).to be_nil
    end

    it 'should to_s work' do
      expect(list.to_s).to eql('( 4 ) -> ( 2 ) -> ( 1 ) -> ( 3 )')
    end

    it 'should pop last item' do
      expect(list.pop).to eql(3)
      expect(list.pop).to eql(1)
      expect(list.pop).to eql(2)
      expect(list.pop).to eql(4)
      expect(list.pop).to be_nil
      expect(list.pop).to be_nil
    end

    it 'should contains? work' do
      expect(list.contains?(2)).to be true
      expect(list.contains?(1)).to be true
      expect(list.contains?(4)).to be true
      expect(list.contains?(6)).to be false
      expect(list.contains?('se')).to be false
      expect(list.contains?(nil)).to be false
    end

    it 'should find work' do
      expect(list.find(4)).to eql(0)
      expect(list.find(3)).to eql(3)
      expect(list.find(6)).to be_nil
      expect(list.find('se')).to be_nil
      expect(list.find(nil)).to be_nil
    end
  end
end
