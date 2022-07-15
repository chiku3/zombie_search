class Zombie < ApplicationRecord
  attachment :image

  has_many :zombie_tags, dependent: :destroy
  has_many :tags, through: :zombie_tags, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

  validates :name, presence: true, length: { maximum: 100 }
  validates :body, presence: true
end
