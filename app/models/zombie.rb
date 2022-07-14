class Zombie < ApplicationRecord
  attachment :image

  has_many :zombie_tags, dependent: :destroy
  has_many :tags, through: :zombie_tags, dependent: :destroy



end
