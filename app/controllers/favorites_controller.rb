class FavoritesController < ApplicationController
  before_action :require_login

  def create
    @zombie = Zombie.find(params[:zombie_id])
    favorite = @zombie.favorites.new(user_id: current_user.id)
    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @zombie = Zombie.find(params[:zombie_id])
    favorite = @zombie.favorites.find_by(user_id: current_user.id)
    if favorite.present?
        favorite.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end

end
