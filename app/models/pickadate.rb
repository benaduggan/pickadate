class Pickadate < ActiveRecord::Base
  has_many :users
  has_one :floor
  
  validates :title, presence: true
  validates :location, presence: true
  validates_datetime :time, :on_or_after => lambda { Time.now.change(:usec =>0) }
  validates :description, presence: true
  validates :rating, numericality: { only_integer: true, greater_then: 1, less_than_or_equal_to: 5 }

end
