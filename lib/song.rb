class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song #song.save
    song

  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|p| p.name == name} #self.all.detect{}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) != true
      Song.create_by_name(name)
    end
    Song.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|a| a.name}
  end

  def self.new_from_filename(filename)
    fileinfo = filename.split(/ - |.mp3/)
    artist_name = fileinfo[0]
    name = fileinfo[1]
    song = Song.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


end
