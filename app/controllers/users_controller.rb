class UsersController < ApplicationController

  # GET /users/
  def index
    users = User.all
    render json: users, except: [:created_at, :updated_at]
  end

  # GET /Users/:id
  def show
    user = User.find(params[:id])
    render json: user, except: [:created_at, :updated_at]
  end


end
