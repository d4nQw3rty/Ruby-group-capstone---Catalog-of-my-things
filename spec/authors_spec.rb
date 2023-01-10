require 'rspec'
require_relative '../author'
require_relative '../item'

describe Author do
  it 'should be able to add an item' do
    author = Author.new('John', 'Doe')
    item = Item.new('Super Mario', '1990-01-01')
    author.add_item(item)
    expect(author.items.length).to eq(1)
  end

  it 'should not be able to add the same item twice' do
    author = Author.new('John', 'Doe')
    item = Item.new('Super Mario', '1990-01-01')
    author.add_item(item)
    author.add_item(item)
    expect(author.items.length).to eq(1)
  end

  it 'should be able to add multiple items' do
    author = Author.new('John', 'Doe')
    item = Item.new('Super Mario', '1990-01-01')
    item2 = Item.new('Super Mario 2', '1990-01-01')
    author.add_item(item)
    author.add_item(item2)
    expect(author.items.length).to eq(2)
  end
end
