
class Music
  attr_reader :title, :artist, :album, :year
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
     song = file_info.unpack('A3A30A30A30A4A28A1A1A1')
     title, artist, album, year, comment, genre = song[1], song[2], song[3], song[4], song[5], song[8]
     puts "Title: #{title}"
     puts "Artist: #{artist}"
     puts "Album: #{album}"
     puts "Year: #{year}"
     puts "Comment: #{comment}"
     puts "Genre: #{genre}"
  end

end

mp3 = Music.new('song.mp3')

