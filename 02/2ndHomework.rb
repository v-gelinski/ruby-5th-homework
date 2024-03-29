class Collection
  include Enumerable

  def Collection.parse(text)
    Collection.new text.each_line("\n\n").map{ |line| Song.parse line.rstrip}
  end

  attr_accessor :artists, :albums, :names

  def initialize(songs)
    @songs = songs
    @artists = songs.map{ |song| song.artist }
    @albums = songs.map{ |song| song.album }
    @names = songs.map{ |song| song.name }
  end

  def each
    @songs.each{ |song| yield song}
  end

  def filter(criteria)
    Collection.new @songs.select{ |song| criteria.fits song }
  end

  def addjoin(other)
    zip(other).flatten.compact
  end
end

class Song

  attr_accessor :name, :artist, :album

  def Song.parse(unparsed_song)
    Song.new *(unparsed_song.each_line("\n").map{ |line| line.rstrip})
  end

  def initialize(name, artist, album)
    @name = name
    @artist = artist
    @album = album
  end
end

class Criteria
  attr_accessor :attribute

  def Criteria.name(name)
    CriteriaByName.new name
  end

  def Criteria.artist(artist)
    CriteriaByArtist.new artist
  end

  def Criteria.album(album)
    CriteriaByAlbum.new album
  end

  def &(other)
    CriteriaAnd.new self, other
  end

  def |(other)
    CriteriaOr.new self, other
  end

  def !
    CriteriaNot.new self
  end

  def initialize(attribute)
    @attribute = attribute
  end
end

class CriteriaByName < Criteria

  def fits(song)
    song.name == @attribute
  end
end

class CriteriaByArtist < Criteria

  def fits(song)
    song.artist == @attribute
  end
end

class CriteriaByAlbum < Criteria

  def fits(song)
    song.album == @attribute
  end
end

class CriteriaAnd < Criteria

  def initialize(criteria1, criteria2)
    @criteria1 = criteria1
    @criteria2 = criteria2
  end

  def fits(song)
    @criteria1.fits(song) && @criteria2.fits(song)
  end
end

class CriteriaOr < Criteria

  def initialize(criteria1, criteria2)
    @criteria1 = criteria1
    @criteria2 = criteria2
  end

  def fits(song)
    @criteria1.fits(song) || @criteria2.fits(song)
  end
end

class CriteriaNot < Criteria

  def initialize(criteria)
    @criteria = criteria
  end

  def fits(song)
    !@criteria.fits(song)
  end
end
