class CreateBasketItems < ActiveRecord::Migration[6.0]
  def change
    create_table :basket_items do |t|
      t.belongs_to :basket
      t.belongs_to :product
      t.bigint :basket_id, null: false
      t.bigint :product_id, null: false
      t.string :quantity, null: false

      t.timestamps
    end
  end
end
