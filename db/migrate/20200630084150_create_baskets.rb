class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.belongs_to :basket_item
      t.belongs_to :product
      t.belongs_to :user
      t.string :delivery_address, null: false
      t.timestamps
    end
  end
end
