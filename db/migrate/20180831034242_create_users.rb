class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.text :bio
      t.string :profilePic
      t.text :favQuote
      t.text :specialty
      t.integer :years_exp

      t.timestamps
    end
  end
end
