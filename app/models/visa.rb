class Visa < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
end
