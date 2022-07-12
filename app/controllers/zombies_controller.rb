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
  end
  
  def edit
  end
  
  def updated
  end

  def index
    @zombies = Zombie.all
  end
  
  def destroy
  end
  
  
  private

  def zombie_params
    params.require(:zombie).permit(:name, :body, :image, :tag_ids[])
  end

end
