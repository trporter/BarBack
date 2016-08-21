class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :glass
      t.string :tools
      t.string :liquor
      t.string :garnish
      t.string :image
      t.text :desrciption
      t.text :instruction

      t.timestamps null: false
    end
  end
end
