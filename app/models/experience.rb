class Experience < ActiveRecord::Base
  validates_associated :position
  validates_associated :employer

  belongs_to :user
  belongs_to :current
  belongs_to :position
  belongs_to :employer

  has_many :workings
  has_many :locations, :through => :workings

  include PositionAssignment
  include EmployerAssignment

  def all_locations=(names)
    self.locations = names.split(",").map do |name|
        Location.where(name: name.strip).first_or_create!
    end
  end

  def all_locations
    self.locations.map(&:name).join(", ")
  end

  def self.worked_with(name)
    Location.find_by_name!(name).experiences
  end
end
