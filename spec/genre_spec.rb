require_relative 'rspec'
require_relative '../genre'
require_relative '../musicAlbum'

describe Genre do
  it 'creates a song using the provided data' do
    genre = Genre.new('Genre')
    expect(genre.name).to eql('Genre')
    expect(genre.id).to be_a(Integer)
    expect(genre.items).to be_a(Array)
  end
end

describe '#add_item' do
  it 'add items to the array and genre to the item properties' do
    genre = Genre.new('Genre')
    music = MusicAlbum.new('name', '2020-10-12')
  end
end
