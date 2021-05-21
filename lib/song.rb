class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    
    song=Song.new()
    song.save
    song

  end

  def Song.new_by_name(name)
    song=Song.new()
    song.name=name
    song.save
    song
  end

  def Song.create_by_name(name)
    song=Song.create
    song.name=name
    song

  end

  def Song.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    song=Song.find_by_name(name)
    if song == nil
      song=Song.create_by_name(name)
    end
    song
  end

  def Song.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def Song.new_from_filename(filename)
    parts=filename.split(' - ')
    song=Song.new_by_name(parts[1].split('.')[0])
    song.artist_name=parts[0]
    song
  

  end

  def Song.create_from_filename(filename)
    parts=filename.split(' - ')
    song=Song.create_by_name(parts[1].split('.')[0])
    song.artist_name=parts[0]
    song

  end

  def Song.destroy_all
    self.all.clear
  end


end
