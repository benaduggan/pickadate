class AddHasPaidToUserPickadates < ActiveRecord::Migration
  def change
		add_column :user_pickadates, :has_paid, :boolean, default: false
  end
end
