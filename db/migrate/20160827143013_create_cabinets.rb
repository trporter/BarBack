class CreateCabinets < ActiveRecord::Migration
  def change
    create_table :cabinets do |t|
      t.string :tools
      t.string :liquor

      t.timestamps null: false
    end
  end
end
