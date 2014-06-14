class AddFacebookInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :year, :integer
    add_column :users, :major, :string
    add_column :users, :floor_id, :integer
    add_column :users, :aboutme, :string
    add_column :users, :hometown, :string
    add_column :users, :relationshipstatus, :string
  end
end
