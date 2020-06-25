class CreateHotelsRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels_restaurants do |t|
      t.string :name
      t.string :address
      t.string :image_url

      t.timestamps
    end
  end
end
