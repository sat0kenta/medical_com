class FavoritesController < ApplicationController
  def create
    @clinical = Clinical.find(params[:clinical_id])
    favorite = current_user.favorites.new(clinical_id: @clinical.id)
    favorite.save

  end

  def destroy
    @clinical = Clinical.find(params[:clinical_id])
    favorite = current_user.favorites.find_by(clinical_id: @clinical.id)
    favorite.destroy

  end
end
