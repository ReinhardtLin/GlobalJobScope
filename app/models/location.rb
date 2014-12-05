class Location < ActiveRecord::Base
  validates_presence_of :name

  has_many :locatings
  has_many :jobs, :through => :locatings
  has_many :stayings
  has_many :users, :through => :stayings
  has_many :workings
  has_many :experiences, :through => :workings
  has_many :educatings
  has_many :educations, :through => :educatings

  # def self.counts
  #   self.select("name, count(locatings.location_id) as count").joins(:locatings).group("locatings.location_id")
  #   self.select("name, count(stayings.location_id) as count").joins(:stayings).group("stayings.location_id")
  #   self.select("name, count(workings.location_id) as count").joins(:workings).group("workings.location_id")
  #   self.select("name, count(educatings.location_id) as count").joins(:educatings).group("educatings.location_id")
  # end
end
