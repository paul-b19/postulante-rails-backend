class CollectionsController < ApplicationController

  # GET /collections/
  def index
    collections = Collection.all
    render json: collections, except: [:created_at, :updated_at]
  end

  # GET /Users/:id
  def show
    collection = Collection.find(params[:id])
    render json: collection, except: [:created_at, :updated_at]
  end

end
