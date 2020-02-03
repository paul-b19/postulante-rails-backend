class RequestsController < ApplicationController

  # GET /requests/
  def index
    requests = Request.all
    render json: requests, except: [:created_at, :updated_at]
  end

  # GET /Users/:id
  def show
    request = Request.find(params[:id])
    render json: request, except: [:created_at, :updated_at]
  end

end
