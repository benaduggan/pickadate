class CreateDates < ActiveRecord::Migration
  def change
    create_table :dates do |t|
      t.string :title
      t.string :location
      t.datetime :time
      t.string :description
      t.integer :rating
      t.string :rsvp_status
    end
  end
end
