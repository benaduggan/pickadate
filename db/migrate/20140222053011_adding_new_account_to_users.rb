class AddingNewAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first, :boolean, default: true
    add_column :users, :pa, :boolean, default: false
  end
end
