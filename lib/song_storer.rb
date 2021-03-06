class SongStorer
  VALID_SOURCE = ['youtube', 'vimeo', 'soundcloud']
  attr_accessor :song_url, :user, :source

  def initialize(params)
    @song_url = URI(params[:song_url])
    @user     = User.find(params[:id])
    @source   = find_source
  end

  def valid_source?
    VALID_SOURCE.include? source
  end

  def find_source
    host_name = song_url.hostname.split('.')
    host_name[(2 - host_name.length).abs]
  end

  def store
    playlist = user.get_playlist
    video = VideoInfo.new(song_url.to_s)
    Song.create(playlist: playlist, url: song_url.to_s, extension: build_source, name: video.title)
  end

  def build_source
    "video/#{source}"
  end
end
