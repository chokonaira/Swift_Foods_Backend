class CreateCheckouts < ActiveRecord::Migration[6.0]
  def change
    create_table :checkouts do |t|
      t.belongs_to :basket
      t.belongs_to :user
      t.string :full_name, null: false
      t.string :delivery_address, null: false
      t.boolean :payment_verified, :default => false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
