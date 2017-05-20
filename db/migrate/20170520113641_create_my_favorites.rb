class CreateMyFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :my_favorites do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
