class Profession < ActiveRecord::Base
  has_many :majorings
  has_many :educations, :through => :majorings
end
