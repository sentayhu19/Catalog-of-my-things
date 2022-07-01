require_relative '../source'

describe Source do
  before do
    @item1 = double('Item')
    allow(@item1).to receive(:source=)
    allow(@item1).to receive(:genre) { 'movie' }
    @source = Source.new('From a friend')
  end

  it 'Should add item to the variable items' do
    item2 = double('Item')
    allow(item2).to receive(:source=)
    allow(item2).to receive(:genre) { 'music' }
    @source.add_item(@item1)
    @source.add_item(item2)
    expect(@source.items.count).to eql 2
  end
end
