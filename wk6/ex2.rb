
class Music
  def initialize(filename)
    f = File.new(filename)
    f.seek(-128, IO::SEEK_END)
    file_info = f.readline
    song_info(file_info) if istag?(file_info)
  end

  def istag?(file_info)
      (file_info.unpack('A3').first == 'TAG') ? true : false
  end

  def song_info(file_info)
     @song = file_info.unpack('A3A30A30A30A4')
  end
  def title
    @song[1]
  end
  def artist
      @song[2]
  end
  def album
      @song[3]
  end
  def year
      @song[4]
  end
end

mp3 = Music.new('song.mp3')
puts "Title is: #{mp3.title}"
puts "Artist is: #{mp3.artist}"
puts "Album is: #{mp3.album}"
puts "Year is: #{mp3.year}"

