class AddOwnerToPickadates < ActiveRecord::Migration
  def change
    add_column :pickadates, :owner, :integer
  end
end
