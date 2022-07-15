class Tag < ApplicationRecord
  has_many :zombie_tags, dependent: :destroy
  has_many :zombies, through: :zombie_tags, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 30 }
  
end
