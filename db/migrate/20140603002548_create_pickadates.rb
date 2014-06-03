class CreatePickadates < ActiveRecord::Migration
  def change
    create_table :pickadates do |t|
      t.string :title
      t.string :location
      t.datetime :time
      t.string :description
      t.integer :rating
      t.string :rsvp_status

      t.timestamps
    end
  end
end
