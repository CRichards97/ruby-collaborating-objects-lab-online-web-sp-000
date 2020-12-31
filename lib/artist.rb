class Artist
  @@all = []
  attr_accessor :name
  attr_reader :songs
  def initialize(name)
   @name = name
   @songs = []
   @@all << self
 end
  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end
  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end
  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end
  def save
  @@all << self unless @@all.include?(self)
end
  def print_songs
    songs.each {|song| puts song.name}
  end
  def add_song(song)
    @songs << song
  end
end
