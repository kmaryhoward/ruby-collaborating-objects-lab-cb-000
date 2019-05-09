class MP3Importer
  attr_accessor :path, :filenames

  def initialize(path)
    @path = path
    @filenames = []
  end

  def files
    Dir.children(path).each {|file| @filenames << file }
  end

  def import
    @filenames.each do |file|
      artist_name = file.split(" - ")[0]
      Artist.find_or_create_by_name(artist_name)
      song = file.split(" - ")[1]
      Song.new_by_filename(song)
      
  end
end

end
