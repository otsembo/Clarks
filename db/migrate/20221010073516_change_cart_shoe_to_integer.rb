class ChangeCartShoeToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :carts, :shoe, :integer
    change_column_default :carts, :shoe, to: 1
  end
end
