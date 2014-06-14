class AddFloorIdToPickadates < ActiveRecord::Migration
  def change
    add_column :pickadates, :floor_id, :integer
  end
end
