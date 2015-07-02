class Player
  attr_accessor :user, :current_song, :current_playlist, :mode
  def initialize(user)
    @user = user
    @current_playlist = user.playlists.first
    # binding.pry
    @current_song = current_playlist.songs.first
    # @mode = player.mode # modes: {NORMAL,RANDOM,SELECTIVE,SUPER-FILTERED}
  end

  def build_data
    play_data = {type: current_song.extension, src: current_song.url}
    Rails.logger.info play_data.to_json
    play_data.to_json
  end

end

# {"type":"video/mp4", "src":"http://solutions.brightcove.com/bcls/assets/videos/Bird_Titmouse.mp4"}
# videojs("example_video_1", { "controls": true, "autoplay": false, "preload": "auto" });
# videojs_rails sources: { mp4: "http://domain.com/path/to/video.mp4", webm: "http://another.com/path/to/video.webm"}, setup: "{}", controls: false, width:"400"
