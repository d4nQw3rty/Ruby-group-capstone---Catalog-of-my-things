require 'rspec'
require_relative '../music_Album'

describe '#initialize' do
  it 'Check whether a song is on spotify' do
    music = MusicAlbum.new('name', '2020-02-12')
    expect(music.name).to eql('name')
    expect(music.published_date).to eql('2020-02-12')
  end
end
