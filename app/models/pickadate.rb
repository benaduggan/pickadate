class Pickadate < ActiveRecord::Base
  has_many :users
    
  validates :title, presence: true
  validates :location, presence: true
  validates_datetime :time, :on_or_after => lambda { Time.now.change(:usec =>0) }
  validates :description, presence: true
  validates :rating, numericality: { only_integer: true, greater_then: 1, less_than_or_equal_to: 5 }
  validate :floor_must_be_valid
  
  def floor_must_be_valid
    ['Broho','Foundation','Sammy 2','Penthouse'].include?(floor)
  end

end
