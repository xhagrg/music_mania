class SongsController < ApplicationController

  def index
  end

  def show
    @song = Song.find(params[:id])
  end

  def next
    player = Player.new(current_user)
    player.increment_index
    @song = player.current_song
    render 'show'
  end
end
