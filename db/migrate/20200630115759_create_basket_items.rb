class CreateBasketItems < ActiveRecord::Migration[6.0]
  def change
    create_table :basket_items do |t|
      t.belongs_to :user
      t.timestamps
    end
  end
end
