class UsersController < ApplicationController

  def index
    @users = if params[:keywords]
               User.where(first_name: /#{params[:keywords]}/i)
             else
               User.all
             end
  end
end
