class AttribsController < ApplicationController

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
