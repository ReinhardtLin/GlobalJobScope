class Locating < ActiveRecord::Base
  belongs_to :job
  belongs_to :location
end
