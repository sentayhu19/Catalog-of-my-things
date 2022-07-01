require 'date'
require_relative '../classes/label'
require_relative '../classes/book'

describe Label do
  context 'When testing the Label class' do
    book = Book.new('The Universe', 'publisher', 'bad', '2022/3/14')
    label = Label.new('Book-label', 'Yellow')

    it 'Should validate the label title' do
      expect(label.title).to eq 'Book-label'
    end

    it 'Should validate the label title' do
      expect(label.color).to eq 'Yellow'
    end

    it 'should add book item object to label items array' do
      label.add_item(book)
      expect(label.items[0]).to eq book
    end
  end
end
