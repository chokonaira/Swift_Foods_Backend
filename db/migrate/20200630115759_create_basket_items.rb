class CreateBasketItems < ActiveRecord::Migration[6.0]
  def change
    create_table :basket_items do |t|
      t.bigint :quantity, null: false
      t.timestamps
    end
  end
end
