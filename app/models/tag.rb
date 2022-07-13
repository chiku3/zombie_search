class Tag < ApplicationRecord
  has_many :zombie_tags, dependent: :destroy
  has_many :zombies, through: :zombie_tags, dependent: :destroy
  
end
