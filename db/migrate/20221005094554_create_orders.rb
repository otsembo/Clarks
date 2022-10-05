class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :amount
      t.integer :status, default: 0
      t.string :cart_data
      t.belongs_to :user

      t.timestamps
    end
  end
end
