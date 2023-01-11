require 'rspec'
require_relative '../book'

describe Book do
  describe '#initialize' do
    it 'creates a new book with the data provided' do
      book = Book.new('Book', 'publisher', 'good', '2002-03-12')
      expect(book.name).to eq('Book')
      expect(book.publisher).to eq('publisher')
      expect(book.published_date).to eq('2002-03-12')
      expect(book.cover_state).to eq('good')
      expect(book.id).to be_a(Integer)
    end
  end

  describe '#can_be_archived?' do
    it 'archives a book which is old enough' do
      oldbook = Book.new('ye olde booke', 'unknown', 'good', '1990-01-31')
      expect(oldbook.can_be_archived?).to eq(true)
    end

    it 'does not archive a recent book' do
      newbook = Book.new('book of newness', 'a literal baby', 'good', '2023-01-01')
      expect(newbook.can_be_archived?).to eq(false)
    end

    it 'archives damaged books regardless of age' do
      damagedbook = Book.new('book of newness', 'a literal baby', 'bad', '2023-01-01')
      expect(damagedbook.can_be_archived?).to eq(true)
    end
  end
end
