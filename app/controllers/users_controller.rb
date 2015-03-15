class UsersController < ApplicationController
  def index
    @users = if params[:keywords]
               User.where(name: "%#{params[:keywords]}%")
             else
               User.all
             end
  end
end
