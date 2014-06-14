class CreateDorms < ActiveRecord::Migration
  def change
    create_table :dorms do |t|
      t.string :name

      t.timestamps
    end
  end
end
