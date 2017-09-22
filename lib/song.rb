
require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  def self.destroy_all
    @@all.clear
  end
  def self.create
    Song.new.save
    self.all.last
  end
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end
  def self.find_by_name(name)
    @@all.detect{|song_name| song_name.name == name}
  end
  def self.find_or_create_by_name(name)
    if !find_by_name(name)
      create_by_name(name)
    else
      find_by_name(name)

    end
  end
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  def self.new_from_filename(file_name)
    parts = file_name.split(" - ")
    artist_name = parts[0]
    name = parts[1].gsub(".mp3","")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
end
def self.create_from_filename(file_name)
  parts = file_name.split(" - ")
  artist_name = parts[0]
  name = parts[1].gsub(".mp3","")
  song = self.create
  song.name = name
  song.artist_name = artist_name
  song
end
end
