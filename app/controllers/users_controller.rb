class UsersController < ApplicationController

  def index
    @users = if params[:keywords]
               User.where(first_name: /#{params[:keywords]}/i)
             else
               User.all
             end
  end

  def show
    @user = User.where(_id: params[:id]).first
    playlist = @user.playlists.first || @user.playlists.create
    @songs = playlist.songs
  end

  def add_song
    song_storer = SongStorer.new(params)
    if song_storer.valid_source?
      flash[:notice] = 'Link added successfully.'
      song_storer.store
    else
      flash[:alert] = "We only support video and audio from #{SongStorer::VALID_SOURCE.join(' ,')}"
    end
    redirect_to :back
  end
end
