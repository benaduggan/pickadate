class Floor < ActiveRecord::Base
  belongs_to :dorm
  has_many :pickadates
  has_many :users
end
