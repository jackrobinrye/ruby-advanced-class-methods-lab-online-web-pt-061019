require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song 
  end 
  
  middle = Song.new_by_name("The Middle")
  secrets = Song.new_by_name("Secrets")
  hello = Song.new_by_name("Hello")
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song 
  end

  def self.find_by_name(song_name)
    song_match = nil 
    self.all.each do |song|
      if song_name == song.name
        song_match = song
      end
    end
    song_match
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      #binding.pry
      self.create_by_name(song_name)
    else 
      self.find_by_name(song_name)
    end
  end
  
  def self.alphabetical
    song_title_array = []
    #iterate through my song array
    Song.all.each do |song|
      #add the name of each song to a new array 
      song_title_array << song.name 
    end 
    binding.pry
  end 
      
  end
    

end
