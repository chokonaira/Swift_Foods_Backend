class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name, null: false
      t.string :description, null: false
      t.decimal :price, null: false

      t.timestamps null: false
    end
  end
end
