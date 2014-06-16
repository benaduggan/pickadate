class AddPickadateIdToFloors < ActiveRecord::Migration
  def change
    add_column :floors, :pickadate_id, :integer
  end
end
