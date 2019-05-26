class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
    no_empty_notes = notes.reject { |n| n.empty? }
    no_empty_notes.each do |note|
      self.notes << Note.find_or_create_by(content: note)
    end
  end

  def note_contents
    notes = Note.where(song_id: self.id)
    contents = []
    notes.each do |note|
      contents << note.content
    end
    contents
  end

end
