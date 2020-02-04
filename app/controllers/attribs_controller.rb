class AttribsController < ApplicationController

  # GET /attribs/
  def index
    attribs = Attrib.all
    render json: attribs, except: [:created_at, :updated_at]
  end

  # GET /attribs/:id
  # def show
  #   attrib = Attrib.find(params[:id])
  #   render json: attrib, except: [:created_at, :updated_at]
  # end

  # POST /attribs/
  def create
    attrib = Attrib.create(attrib_params)
    render json: attrib, except: [:created_at, :updated_at]
  end

  # PUT /attribs/:id
  def update
    attrib = Attrib.find(attrib_params[:id])
    attrib.update(attrib_params)
    render json: attrib, except: [:created_at, :updated_at]
  end

  # DELETE /attribs/:id
  def destroy
    attrib = Attrib.find(attrib_params[:id])
    attrib.destroy
    head :no_content
  end

  private
  
  def attrib_params
    params.permit(:id, :attr_type, :key, :value, :description, :request_id)
  end

end
