
class Music
  attr_reader :tag, :title, :artist, :album, :year, :comment, :genre
  def initialize(filename)
    f = File.new(filename)
    f.seek(-128, IO::SEEK_END)
    file_info = f.readline
    ID3_mapping(file_info) if has_tag?(file_info)
  end

  def has_tag?(file_info)
      file_info.unpack('A3').first == 'TAG'
  end

  def ID3_mapping(file_info)
     @tag, @title, @artist, @album, @year, @comment, @genre = file_info.unpack('A3A30A30A30A4A28A1A1A1')
  end

end

mp3 = Music.new('song.mp3')
puts "Title: #{mp3.title}"
puts "Artist: #{mp3.artist}"
puts "Album: #{mp3.album}"
puts "Year: #{mp3.year}"
puts "Comment: #{mp3.comment}"
puts "Genre: #{mp3.genre}"
