class RenameColumnToShoeId < ActiveRecord::Migration[7.0]
  def change
    rename_column :carts, :shoe, :shoe_id
  end
end
