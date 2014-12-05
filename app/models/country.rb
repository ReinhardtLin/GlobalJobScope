class Country < ActiveRecord::Base
  has_many :livings
  has_many :users, :through => :livings

  # def self.counts
  #   self.select("name, count(livings.country_id) as count").joins(:livings).group("livings.country_id")
  #   self.select("name, count(visas.country_id) as count").joins(:visas).group("visas.country_id")
  # end
end
