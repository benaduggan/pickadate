class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.string :name
      t.string :gender

      t.timestamps
    end
  end
end
