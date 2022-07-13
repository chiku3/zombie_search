class DiagnoseController < ApplicationController
  def diagnose
  end

  def index
    # @zombies = Zombie.includes(:tags).where(tags: {name: "映画"}).or(Zombie.includes(:tags).where(tags: {name: "ドラマ"}))

    if params[:q_1] == 'a'
      @zombies_1 = Zombie.includes(:tags).where(tags: {name: "映画"}).or(Zombie.includes(:tags).where(tags: {name: "ドラマ"}))
    elsif params[:q_1] == 'b'
      @zombies_1 = Zombie.includes(:tags).where(tags: {name: "ゲーム"}).or(Zombie.includes(:tags).where(tags: {name: "スマホアプリ"}))
    end

    if params[:q_2] == 'a'
      @zombies_2 = Zombie.includes(:tags).where(tags: {name: "こわい"}).or(Zombie.includes(:tags).where(tags: {name: "ホラー"}))
    elsif params[:q_2] == 'b'
      @zombies_2 = Zombie.includes(:tags).where(tags: {name: "かわいい"}).or(Zombie.includes(:tags).where(tags: {name: "恋愛"}))
    end

    s1 = @zombies_1.ids.uniq
    s2 = @zombies_2.ids.uniq
    total = s1.push(s2)
    total.flatten!
    @total_s = total.select{ |e| total.count(e) == 2 }.uniq
    @zombies = Zombie.where id: @total_s
    


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
