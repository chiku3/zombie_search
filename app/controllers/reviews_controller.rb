class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @zombie = Zombie.find(params[:zombie_id])
    @review = @zombie.reviews.new(user_id: current_user.id, body: params[:review][:body])
    if @review.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @zombie = Zombie.find(params[:zombie_id])
    review = @zombie.reviews.find_by(user_id: current_user.id)
    if review.present?
        review.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end

end
