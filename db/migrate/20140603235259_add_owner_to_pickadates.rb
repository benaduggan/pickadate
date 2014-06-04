class AddOwnerToPickadates < ActiveRecord::Migration
  def change
    add_column :pickadates, :owner, :boolean
  end
end
