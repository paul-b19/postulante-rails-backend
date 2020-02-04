class BodiesController < ApplicationController

  # GET /bodies/
  def index
    bodies = Body.all
    render json: bodies, except: [:created_at, :updated_at]
  end

  # GET /bodies/:id
  # def show
  #   body = Body.find(params[:id])
  #   render json: body, except: [:created_at, :updated_at]
  # end

  # POST /bodies/
  def create
    body = Body.create(body_params)
    render json: body, except: [:created_at, :updated_at]
  end

  # PUT /bodies/:id
  def update
    body = Body.find(body_params[:id])
    body.update(body_params)
    render json: body, except: [:created_at, :updated_at]
  end

  # DELETE /bodies/:id
  def destroy
    body = Body.find(body_params[:id])
    body.destroy
    head :no_content
  end

  private
  
  def body_params
    params.permit(:id, :body_type, :key, :value, :description, :raw_body, :request_id)
  end
  
end
