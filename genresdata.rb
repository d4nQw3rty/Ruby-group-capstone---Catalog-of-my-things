require 'json'
require_relative 'genre'

module GenresData
  def write_json(array, file_path)
    File.write(file_path, JSON.pretty_generate(array))
  end

  def read_json(file_path)
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  def save_genres
    array = read_json('./JSON_data/genres.json')
    list_id = []
    array.each { |genre| list_id.push(genre['id']) }
    @genrelist.each do |genre|
      next if list_id.include?(genre.id)

      array.push(
        {
          name: genre.name,
          id: genre.id
        }
      )
    end
    write_json(array, './JSON_data/genres.json')
  end

  def load_genres
    parse_file = read_json('./JSON_data/genres.json')
    parse_file.each do |genre|
      @genrelist.push(Genre.new(genre['name'], id: genre['id']))
    end
  end
end
