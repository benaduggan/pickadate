class UserPickadate < ActiveRecord::Base
  belongs_to :user
  belongs_to :pickadate
end
