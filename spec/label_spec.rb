require 'rspec'
require_relative '../book'
require_relative '../label'

describe Label do
  describe '#initialize' do
    it 'creates the label item with its properties' do
      label = Label.new('title', 'blue')
      expect(label.title).to eq('title')
      expect(label.color).to eq('blue')
      expect(label.id).to be_a(Integer)
      expect(label.items).to be_a(Array)
    end
  end

  describe '#add_item' do
    it 'adds the item to the items array, and the label to the item properties' do
      label = Label.new('title', 'blue')
      book = Book.new('Book', 'publisher', 'good', '2002-03-12')
      label.add_item(book)
      expect(label.items).to include(book)
      expect(book.label).to eq(label)
    end
  end
end
