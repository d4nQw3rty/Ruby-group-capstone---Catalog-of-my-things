require 'json'
require_relative 'game'

module GamesData
  def write_json(array, file_path)
    File.write(file_path, JSON.pretty_generate(array))
  end

  def read_json(file_path)
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  def save_games
    array = read_json('./JSON_data/games.json')
    list_id = []
    array.each { |game| list_id.push(game['id']) }
    @gamelist.each do |game|
      next if list_id.include?(game.id)

      label = game.label.id || nil
      author = game.author.id || nil
      genre = game.genre.id || nil
      array.push({ name: game.name, published_date: game.published_date, last_played_date: game.last_played_date,
                   author: author, label: label, genre: genre, id: game.id, archived: game.archived })
    end
    write_json(array, './JSON_data/games.json')
  end

  def load_games
    parse_file = read_json('./JSON_data/games.json')
    parse_file.each do |game|
      correctlabel = @labellist.find { |label| label.id == game['label'] }
      correctauthor = @authorlist.find { |author| author.id == game['author'] }
      correctgenre = @genrelist.find { |genre| genre.id == game['genre'] }
      loadedgame = Game.new(game['name'], game['published_date'], game['multiplayer'],
                            game['last_played_date'], id: game['id'], archived: game['archived'])
      @gamelist.push(loadedgame)
      loadedgame.add_label(correctlabel)
      loadedgame.add_author(correctauthor)
      loadedgame.add_genre(correctgenre)
    end
  end
end
