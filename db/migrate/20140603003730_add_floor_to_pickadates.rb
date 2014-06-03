class AddFloorToPickadates < ActiveRecord::Migration
  def change
    add_column :pickadates, :floor, :string
  end
end
