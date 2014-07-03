class AddCostToPickadates < ActiveRecord::Migration
  def change
    add_column :pickadates, :cost, :float, default: 0.0
  end
end
