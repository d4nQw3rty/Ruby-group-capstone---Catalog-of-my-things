require 'rspec'
require_relative '../item'
require_relative '../label'

describe Item do
  describe '#initialize' do
    it 'create item correctly' do
      item = Item.new('name', '2000-03-24')
      expect(item.name).to eq('name')
      expect(item.published_date).to eq('2000-03-24')
      expect(item.id).to be_a(Integer)
      expect(item.archived).to eq(false)
    end
  end

  describe '#can_be_archived?' do
    it 'archives an item which is old enough' do
      olditem = Item.new('ye olde iteme', '1990-01-31')
      expect(olditem.can_be_archived?).to eq(true)
    end

    it 'does not archive a recent item' do
      newitem = Item.new('item of newness', '2023-01-01')
      expect(newitem.can_be_archived?).to eq(false)
    end
  end

  describe '#move_to_archive' do
    it 'moves when correct' do
      olditem = Item.new('ye olde iteme', '1990-01-31')
      olditem.move_to_archive
      expect(olditem.archived).to eq(true)
    end

    it 'does not move when incorrect' do
      newitem = Item.new('item of newness', '2023-01-01')
      newitem.move_to_archive
      expect(newitem.archived).to eq(false)
    end
  end
end
