class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :directions
      t.text :description
      t.integer :servingSize
      t.string :timeCook
      t.string :timePrep
      t.integer :calories
      t.string :picture
      t.text :ingredients
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
