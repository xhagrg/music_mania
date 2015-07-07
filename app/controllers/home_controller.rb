class HomeController < ApplicationController

  def index
    @playlist_data = Player.new(current_user).build_data
    respond_to do |format|
      format.html
      format.js
    end
  end
end
