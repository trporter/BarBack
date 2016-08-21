class AddCocktailReferencesToFavorite < ActiveRecord::Migration
  def change
    add_reference :favorites, :cocktail, index: true, foreign_key: true
  end
end
