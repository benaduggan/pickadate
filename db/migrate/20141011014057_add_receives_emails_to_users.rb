class AddReceivesEmailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :receives_emails, :boolean, default: true
  end
end
