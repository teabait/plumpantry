class AddNameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string, null: false
  end

  def down
    drop_column :users, :name
  end
end
