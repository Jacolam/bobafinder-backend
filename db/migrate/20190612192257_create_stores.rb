class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :img_url
      t.string :location

      t.timestamps
    end
  end
end
