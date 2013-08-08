class FavoritesController < ApplicationController

  def index
    favorites = Favorite.find_by_user_id(params[:user_id])
    render :json => favorites.to_json
  end

  def create
    favorite = Favorite.new(params[:favorite])
    if favorite.save
      render :json => favorite.to_json
    else
      render :json => favorite.errors, status: :unprocessable_entity
    end
  end

end
