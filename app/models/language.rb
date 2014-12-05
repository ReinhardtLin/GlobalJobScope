class Language < ActiveRecord::Base
  belongs_to :level
  has_many :speakings
  has_many :users, :through => :speakings

  def self.counts
    self.select("name, count(speakings.language_id) as count").joins(:speakings).group("speakings.language_id")
  end
end
