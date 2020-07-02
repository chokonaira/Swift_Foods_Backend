class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
