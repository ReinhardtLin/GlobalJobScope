class Current < ActiveRecord::Base
  has_many :experiences
  has_many :educations
end
