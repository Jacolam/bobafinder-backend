class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :img_url
      t.string :address
      t.string :lng
      t.string :lat

      t.timestamps
    end
  end
end
