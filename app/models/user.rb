class User < ActiveRecord::Base
  has_secure_password

  has_one :cabinet
  has_many :cocktails, dependent: :nullify
  has_many :favorites, dependent: :nullify
  has_many :favorited_cocktails, through: :favorites, source: :cocktail

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}"
  end

end
