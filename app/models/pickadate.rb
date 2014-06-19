class Pickadate < ActiveRecord::Base
  has_many :user_pickadates
  has_many :users, through: :user_pickadates
  
  belongs_to :floor
  
  validates :title, presence: true
  validates :location, presence: true
  validates_datetime :time, :on_or_after => lambda { Time.now.change(:usec =>0) }
  validates :description, presence: true

end
