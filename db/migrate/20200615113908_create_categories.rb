class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.belongs_to :hotels_restaurant
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
