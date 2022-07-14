class ZombiesController < ApplicationController
  def new
    @zombie = Zombie.new
  end

  def create
    @zombie = Zombie.new(zombie_params)
    @zombie.save
    redirect_to zombie_path(@zombie)
  end

  def show
    @zombie = Zombie.find(params[:id])
  end

  def edit
    @zombie = Zombie.find(params[:id])
  end

  def update
    @zombie = Zombie.find(params[:id])
    @zombie.update(zombie_params)
    redirect_to zombie_path(@zombie)
  end

  def index
    @zombies = Zombie.includes(:tags).where(tags: {name: params[:tag_name]})
  end

  def destroy
    @zombie = Zombie.find(params[:id])
    @zombie.destroy
    redirect_to zombies_path
  end


  private

  def zombie_params
    params.require(:zombie).permit(:name, :body, :image, tag_ids: [])
  end

  def tag_params
    params.require(:tag).permit(:name, zombie_ids: [])
  end
end
