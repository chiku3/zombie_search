class ZombieTag < ApplicationRecord
  belongs_to :zombie
  belongs_to :tag
  
  validates :zombie_id, uniqueness: { scope: :tag_id }
end
