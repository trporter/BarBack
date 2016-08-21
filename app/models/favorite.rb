class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :cocktail

  validates :user_id, uniqueness: {scope: :cocktail_id}
end
