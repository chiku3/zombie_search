class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :zombie
  
  validates :user_id, uniqueness: { scope: :zombie_id }
end
