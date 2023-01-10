require 'rspec'
require_relative '../genre'
require_relative '../music_album'

describe Genre do
  it 'creates a song using the provided data' do
    genre = Genre.new('Genre')
    expect(genre.name).to eql('Genre')
    expect(genre.id).to be_a(Integer)
    expect(genre.items).to be_a(Array)
  end
end
