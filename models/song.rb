require ('pg')
require_relative ('album')
require_relative ('artist')
require_relative ('song')

class Song

  attr_accessor :title, :duration, :album_id, :cost
  attr_reader :id


  def initialize(options)
    @title = options["title"]
    @duration = options["duration"]
    @cost = options["cost"].to_f
    @album_id = options["album_id"].to_i
    @id = options["id"].to_i if options ["id"]
  end

  def save
    sql = "INSERT INTO songs (title, duration, cost, album_id) VALUES ('#{@title}', '#{@duration}', #{@cost}, #{@album_id}) returning *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

 def update
   return unless @id
   sql = "UPDATE songs SET
         (title, duration, cost, album_id) = 
         ('#{@title}', '#{@duration}', #{@cost}, #{@album_id})
         WHERE id = #{@id};"
   result = SqlRunner.run(sql)
 end

 def delete()
   return unless @id
   sql = "DELETE FROM songs WHERE id = #{id};"
   result = SqlRunner.run(sql)
 end
 
 def album() 
   sql = "SELECT * FROM albums WHERE id = #{@album_id};"
   result = SqlRunner.run(sql)
   album = Album.new(result[0])
   return album
 end 




 def self.all
   sql = "SELECT * FROM songs;"
   result = SqlRunner.run(sql)
   return result.map{|hash|Song.new(hash)}
 end

 def self.delete_all
   sql = "DELETE FROM songs;"
   result = SqlRunner.run(sql)
 end


end