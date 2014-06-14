class AddFloorIdToDorms < ActiveRecord::Migration
  def change
    add_column :dorms, :floor_id, :integer
  end
end
