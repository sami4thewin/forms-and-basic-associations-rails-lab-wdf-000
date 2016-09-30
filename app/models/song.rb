class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    # self.artist.name
  end

  def artist_name
    # binding.pry
    if self.artist != nil
      self.artist.name
    end
  end

  def genre_id
    self.genre
  end

  def genre_id=(id)
    self.genre = Genre.find_by(id: id)
  end

  def song_notes
    self.notes
    # binding.pry
  end

  def song_notes=(notes)
    if !notes[0].empty?
      notes.each do |string|
        # binding.pry
        note = Note.find_or_create_by(content: string)
        self.notes << note
      end
    end
  end

  def note_contents=(notes)
    # if !notes[0].empty?
      notes.each do |string|
        # binding.pry
        if !string.empty?
          note = Note.find_or_create_by(content: string)
          self.notes << note
        end
      end
    # end
  end


  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  def genre_name=(name)
    # binding.pry
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    self.genre.name
  end



end
