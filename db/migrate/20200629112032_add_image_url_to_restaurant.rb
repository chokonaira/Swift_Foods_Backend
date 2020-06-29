class AddImageUrlToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels_restaurants, :image_url, :string
  end
end
