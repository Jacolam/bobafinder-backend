class CreateUserStores < ActiveRecord::Migration[5.2]
  def change
    create_table :user_stores do |t|
      t.integer :user_id
      t.integer :store_id
      t.boolean :visited
      t.boolean :favorite
      t.timestamps
    end
  end
end
