class AddPictureUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pictureurl, :string
  end
end
