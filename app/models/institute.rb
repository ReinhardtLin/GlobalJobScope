class Institute < ActiveRecord::Base
  has_many :educations

  validates_presence_of :name
end
