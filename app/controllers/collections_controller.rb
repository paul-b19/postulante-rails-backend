class CollectionsController < ApplicationController

  # GET /collections/
  def index
    collections = Collection.all
    render json: collections, except: [:created_at, :updated_at]
  end

  # GET /collections/:id
  # def show
  #   collection = Collection.find(params[:id])
  #   render json: collection, except: [:created_at, :updated_at]
  # end

  # POST /collections/
  def create
    collection = Collection.create(collection_params)
    render json: collection, except: [:created_at, :updated_at]
  end

  # PUT /collections/:id
  def update
    collection = Collection.find(collection_params[:id])
    collection.update(collection_params)
    render json: collection, except: [:created_at, :updated_at]
  end

  private
  
  def collection_params
    params.permit(:id, :name, :user_id)
  end

end
