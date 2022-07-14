class DiagnoseController < ApplicationController
  def diagnose
  end

  def index

    #ゾンビと何したい？
    if params[:q_1] == 'a' #ゾンビを鑑賞したい
      zombies_1 = Zombie.includes(:tags).where(tags: {name: "映画"}).or(Zombie.includes(:tags).where(tags: {name: "ドラマ"}))
    elsif params[:q_1] == 'b' #ゾンビと遊びたい
      zombies_1 = Zombie.includes(:tags).where(tags: {name: "ゲーム"}).or(Zombie.includes(:tags).where(tags: {name: "スマホアプリ"}))
    end
    s1 = zombies_1.ids.uniq #該当するゾンビidの配列
    
    # どっちのゾンビが好き？
    if params[:q_2] == 'a' #怖いゾンビ
      zombies_2 = Zombie.includes(:tags).where(tags: {name: "こわい"}).or(Zombie.includes(:tags).where(tags: {name: "ホラー"}))
    elsif params[:q_2] == 'b' #かわいいゾンビ
      zombies_2 = Zombie.includes(:tags).where(tags: {name: "かわいい"}).or(Zombie.includes(:tags).where(tags: {name: "シュール"}))
    end
    s2 = zombies_2.ids.uniq #該当するゾンビidの配列
    
    # ゾンビと何したい？
    if params[:q_3] == 'a' #ゾンビと戦いたい
      zombies_3 = Zombie.includes(:tags).where(tags: {name: "パニック"}).or(Zombie.includes(:tags).where(tags: {name: "アクション"}))
    elsif params[:q_3] == 'b' #ゾンビと仲良くなりたい
      zombies_3 = Zombie.includes(:tags).where(tags: {name: "恋愛"}).or(Zombie.includes(:tags).where(tags: {name: "青春"}))
    end
    s3 = zombies_3.ids.uniq #該当するゾンビidの配列
    
    # ゾンビとの接し方は？
    if params[:q_4] == 'a' #サクッと
      zombies_4 = Zombie.includes(:tags).where(tags: {name: "映画"}).or(Zombie.includes(:tags).where(tags: {name: "スマホアプリ"}))
    elsif params[:q_4] == 'b' #長期的に
      zombies_4 = Zombie.includes(:tags).where(tags: {name: "ドラマ"}).or(Zombie.includes(:tags).where(tags: {name: "ゲーム"}))
    end
    s4 = zombies_4.ids.uniq #該当するゾンビidの配列
    
    #質問から取得したゾンビidの配列を結合
    total = s1 << s2 << s3 << s4
    total.flatten!
    #「重複回数＝質問の数」のidを取得
    total_s = total.select{ |e| total.count(e) == 4 }.uniq
    @zombies = Zombie.where id: total_s

  end

  private

  def diagnose_params
    params.require(:diagnose).permit(tag_ids: [])
  end


end
