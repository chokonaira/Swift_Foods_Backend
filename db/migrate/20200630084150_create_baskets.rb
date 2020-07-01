class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.belongs_to :user
      t.string :quantity, null: false
      t.string :delivery_address, null: false
      t.boolean :isVerified, null: false, :default => false

      t.timestamps
    end
  end
end
