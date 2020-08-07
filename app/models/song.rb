class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    @all_notes = []
    contents.each do |contents|
      if contents.length > 0
        note = Note.create(content: contents, song: self)
        @all_notes << note
      end
    end
  end

  def note_contents
    @all_notes
  end
end
