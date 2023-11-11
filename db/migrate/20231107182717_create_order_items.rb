class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :purchase_order, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true
      t.string :currency
      t.integer :quantity_ordered
      t.integer :quantity_shipped
      t.float :price
      t.float :discount
      t.float :tax
      t.float :platform_fee

      t.timestamps
    end
  end
end
