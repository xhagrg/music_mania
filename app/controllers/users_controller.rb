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
end
