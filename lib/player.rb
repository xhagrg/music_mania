class Player
  CURRENT_INDEX = 'current_index'

  attr_accessor :user, :song, :current_playlist, :mode, :index
  def initialize(user)
    @user = user
    @current_playlist = user.get_playlist
    @song = current_song
    # @mode = player.mode # modes: {NORMAL,RANDOM,SELECTIVE,SUPER-FILTERED}
  end

  def build_data
    { src: song.url, type: song.extension }.to_json
  end

  def current_index
    @index = $redis.hget(CURRENT_INDEX, user.id.to_s).to_i
  end

  def current_song
    current_playlist.songs[current_index] || Song.first
  end

  def reset_index
    $redis.hset(CURRENT_INDEX, user.id.to_s, 0)
  end

  def increment_index
    songs_size = @current_playlist.songs.size
    if index >= songs_size
      reset_index
    elsif @current_playlist.songs.size > 0
      @index = $redis.hincrby(CURRENT_INDEX, user.id.to_s, 1)
    end
  end
end
