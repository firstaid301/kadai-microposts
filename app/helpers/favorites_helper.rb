module FavoritesHelper
  def like_user
    @like_user ||= Favorite.find_by(micropost_id: micropost.id)
  end
end
