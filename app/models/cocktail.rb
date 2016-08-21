class Cocktail < ActiveRecord::Base
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favoriting_users, through: :favorites, source: :users

  validates :name, presence: true
  validates :liquor, presence: true
  validates :instruction, presence: true
  # validates :glass, presence: true

  mount_uploader :image, AvatarUploader

  def favorite_for(user)
    favorites.find_by_user_id user
  end

  def favorite_for(user)
    favorites.find_by_user_id(user)
  end

  def favorited_by?(user)
    favorites.exists?(user: user)
  end

end
