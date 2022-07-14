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

  def search
    @keyword = params[:keyword]
    zombie_1 = Zombie.where(["name like? OR body like?", "%#{@keyword}%", "%#{@keyword}%"])
      s1 = zombie_1.ids.uniq #検索で取得したゾンビdiを取得
    zombie_2 = Zombie.includes(:tags).where(tags: {name: "#{@keyword}"})
      s2 = zombie_2.ids.uniq  #検索で取得したゾンビdiを取得

    #検索から取得したゾンビidの配列を結合
    total = s1 << s2
    total.flatten!
    total_s = total.uniq
    @zombies = Zombie.where id: total_s

    render "index"
  end

  def index
    if params[:tag_name].present?
      @zombies = Zombie.includes(:tags).where(tags: {name: params[:tag_name]})
    else
      @zombies = Zombie.all
    end
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
