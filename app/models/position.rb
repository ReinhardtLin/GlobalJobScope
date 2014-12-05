class Position < ActiveRecord::Base
  has_many :jobs
  has_many :experiences

  validates_presence_of :name
end
