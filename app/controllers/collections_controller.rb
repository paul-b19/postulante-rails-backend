class CollectionsController < ApplicationController

  # POST /collections/
  def create
    collection = Collection.create(collection_params)
    render json: collection, except: [:created_at, :updated_at]
  end

  # DELETE /collections/:id
  def destroy
    collection = Collection.find(collection_params[:id])
    collection.destroy
    head :no_content
  end

  private
  
  def collection_params
    params.permit(:id, :name, :user_id)
  end

end
