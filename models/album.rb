require ('pg')
require_relative('../db/SqlRunner')
require_relative('artist')
require_relative('song')

class Album

attr_accessor :title, :genre, :artist_id
attr_reader :id

  def initialize (options)
    @title = options["title"]
    @id = options["id"].to_i if options["id"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def save
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{artist_id}) returning *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end


  def update
    return unless @id
    sql = "UPDATE albums SET
          (title, genre, artist_id) = 
          ('#{@title}', '#{@genre}', #{artist_id})
          WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end

  def delete()
    return unless @id
    sql = "DELETE FROM albums WHERE id = #{id};"
    result = SqlRunner.run(sql)
  end
 
  def artist() 
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    result = SqlRunner.run(sql)
    artist = Artist.new(result[0])
    return artist
  end 

  def tracks() 
    sql = "SELECT * FROM songs WHERE album_id = #{@id};"
    tracks = SqlRunner.run(sql)
    result = tracks.map{|hash|Song.new(hash)}
    return result
  end

  def album_cost()
   sql = "SELECT sum (cost) FROM songs WHERE album_id = #{@id};"
   result = SqlRunner.run(sql)
   album_cost = result[0].values
   return album_cost 
  end



  def self.all
    sql = "SELECT * FROM albums;"
    result = SqlRunner.run(sql)
    return result.map{|hash|Album.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM albums;"
    result = SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return result.map{|hash|Album.new(hash)}
  end

  # def self.tracks
  #   sql = "SELECT * FROM songs;"
  #   result = SqlRunner.run(sql)
  #   return result.map{|hash|Song.new(hash)}
  # end

end