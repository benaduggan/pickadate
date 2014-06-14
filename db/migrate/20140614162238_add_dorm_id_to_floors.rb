class AddDormIdToFloors < ActiveRecord::Migration
  def change
    add_column :floors, :dorm_id, :integer
  end
end
