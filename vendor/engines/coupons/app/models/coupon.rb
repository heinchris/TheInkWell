class Coupon < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :photo, :class_name => 'Image'
end
