class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    favorite = Favorite.new()
    favorite.user_id = current_user.id
    favorite.micropost_id = params[:micropost_id]
    favorite.save
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to root_url 
  end
  
  def destroy
    favorite = current_user.favorites.find_by(micropost_id: params[:micropost_id])
    favorite.destroy if favorite
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_url 
  end

end
