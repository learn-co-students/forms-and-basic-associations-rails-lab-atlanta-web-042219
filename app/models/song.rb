class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #setter
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  #getter
  def artist_name
    self.artist ? self.artist.name : nil
  end

  #setter
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  #getter
  def genre_name
    self.genre ? self.genre.name : nil
  end

  #setter
  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  #getter
  def note_contents
    self.notes.map(&:content)
  end

end
