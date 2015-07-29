class Player
  attr_accessor :user, :songs, :current_playlist, :mode
  def initialize(user)
    @user = user
    @current_playlist = user.get_playlist
    @songs = current_playlist.songs
    # @mode = player.mode # modes: {NORMAL,RANDOM,SELECTIVE,SUPER-FILTERED}
  end

  def build_data
    playlist_data = songs.map { |song| template = { type: song.extension, src: song.url } }
    playlist_data.to_json
  end
end
