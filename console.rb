require ('pry-byebug')
require_relative ('models/album')
require_relative ('models/artist')
require_relative ('models/song')

Song.delete_all()
Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({
  "name"=>"U2"
  })
artist1.save()


artist2 = Artist.new({
  "name"=>"Oasis"
  })
artist2.save()


album1 = Album.new({
  "title" => "The Joshua Tree",
  "genre" => "Rock",
  "artist_id"=> artist1.id
  })
album1.save()


album2 = Album.new({
  "title" => "How to Dismantle an Atomic Bomb",
  "genre" => "Rock",
  "artist_id"=> artist1.id
  })
album2.save()


album3 = Album.new({
  "title"=>"(Whats the story) morning glory?",
  "genre"=>"Britpop",
  "artist_id"=>artist2.id
  })
album3.save()




song1 = Song.new({
  "title" => "Where the streets have no name",
  "duration" => "5:38",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song1.save()

song2 = Song.new({
  "title" => "I still havent found what Im looking for",
  "duration" => "4:38",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song2.save()

song3 = Song.new({
  "title" => "With or without you",
  "duration" => "4:56",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song3.save()

song4 = Song.new({
  "title" => "Bullet the blue sky",
  "duration" => "4:32",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song4.save()

song5 = Song.new({
  "title" => "Running to stand still",
  "duration" => "4:18",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song5.save()

song6 = Song.new({
  "title" => "Red hill mining town",
  "duration" => "4:54",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song6.save()

song7 = Song.new({
  "title" => "In Gods country",
  "duration" => "2:57",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song7.save()

song8 = Song.new({
  "title" => "Trip through your wires",
  "duration" => "5:38",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song8.save()

song9 = Song.new({
  "title" => "One tree hill",
  "duration" => "4:43",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song9.save()

song10 = Song.new({
  "title" => "Exit",
  "duration" => "4:53",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song10.save()

song11 = Song.new({
  "title" => "Mothers of the disappeared",
  "duration" => "5:12",
  "cost"=> 0.99,
  "album_id" => album1.id
  })
song11.save()

# album2.tracks()






# artist1.name = "not U2"
# artist1.update()

# album1.genre = "Classical"
# album1.update()

# album2.delete()
# artist2.delete()

# artist51 = Artist.find(51)



artists = Artist.all()
albums = Album.all()
songs = Song.all()

binding.pry
nil