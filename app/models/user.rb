class User < ApplicationRecord
  before_save {self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,  length: { maximum: 200 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  has_secure_password


  has_many :favorites, dependent: :destroy
  has_many :reviwes, dependent: :destroy
  has_many :zombies, dependent: :destroy
end
