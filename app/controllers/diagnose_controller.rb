class DiagnoseController < ApplicationController
  def diagnose
  end

  def index
    @zombies = Zombie.includes(:tags).where(tags: {name: "ゲーム"})

    if params[:p_01] == "1"
      zombie_1 = Zombie.where("(tag.name = ?) OR (tag.name = ?)", "映画", "ドラマ")
    else
      zombie_1 = Zombie.where("(tag.name = ?) OR (tag.name = ?)", "ゲーム", "スマホアプリ")
    end

    if params[:p_02] == "1"
      @zombie_2 = zombie_1.where("(tag.name = ?) OR (tag.name = ?)", "こわい", "ホラー")
    else
      @zombie_2 = zombie_1.where("(tag.name = ?) OR (tag.name = ?)", "かわいい", "恋愛")
    end



    # zombies = Zombie.all
    # selected_tag_ids = params[:q_04]
    # @mach_tag_count = 0
    # tmp_mach_tag_count = 0
    # @mached_zombies = []

    # zombies.each do |zombie|
    #   tmp_mach_tag_count = 0
    #   zombie.tags.each do |tag|
    #     if selected_tag_ids&.include?(tag.id.to_s)
    #       tmp_mach_tag_count = tmp_mach_tag_count + 1
    #     end
    #   end

    #   if @mach_tag_count < tmp_mach_tag_count
    #     @mached_zombies = []
    #     @mached_zombies << zombies
    #     @mach_tag_count = tmp_mach_tag_count
    #   elsif @mach_tag_count == tmp_mach_tag_count
    #     @mached_zombies << zombies
    #   end
    # end
  end

  private

  def diagnose_params
    params.require(:diagnose).permit(tag_ids: [])
  end


end
