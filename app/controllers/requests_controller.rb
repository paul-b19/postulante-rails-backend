class RequestsController < ApplicationController

  # GET /requests/:id
  def show
    request = Request.find(params[:id])
    render json: request.to_json(:include => {
      :attribs => {:except => [:created_at, :updated_at]}, 
      :bodies => {:except => [:created_at, :updated_at]}
    }, :except => [:created_at, :updated_at])
  end

  # POST /requests/
  def create
    request = Request.create(request_params)
    render json: request, except: [:created_at, :updated_at]
  end

  # PUT /requests/:id
  def update
    request = Request.find(request_params[:id])
    request.update(request_params)
    render json: request, except: [:created_at, :updated_at]
  end

  private
  
  def request_params
    params.permit(:id, :title, :method, :url, :collection_id)
  end

end
