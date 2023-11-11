class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :sku
      t.string :title
      t.string :nickname
      t.float :price
      t.integer :inventory
      t.float :fulfillment_fee
      t.float :unit_cost

      t.timestamps
    end
  end
end
