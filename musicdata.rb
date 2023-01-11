require 'json'
require_relative 'musicalbum'

module MusicData
  def write_json(array, file_path)
    File.write(file_path, JSON.pretty_generate(array))
  end

  def read_json(file_path)
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  def save_music
    array = read_json('./JSON_data/music_album.json')
    list_id = []
    array.each { |music| list_id.push(music['id']) }
    @musiclist.each do |music|
      next if list_id.include?(music.id)

      genre = music.genre.id || nil
      array.push({ name: music.name, published_date: music.published_date, Archived: music.archived, genre: genre })
    end
    write_json(array, './JSON_data/music_album.json')
  end

  def load_musicalbums
    parse_file = read_json('./JSON_data/music_album.json')
    parse_file.each do |music|
      correctgenre = @genrelist.find { |genre| genre.id == music['genre'] }
      loadedmusic = MusicAlbum.new(music['name'], music['publish_date'], id: music['id'], archived: music['archived'])
      @musiclist.push(loadedmusic)
      loadedmusic.add_genre(correctgenre)
    end
  end
end
