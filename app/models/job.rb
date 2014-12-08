class Job < ActiveRecord::Base

  validates_associated :position
  validates_associated :employer

  validates_presence_of :number

  belongs_to :user
  belongs_to :type
  belongs_to :position
  belongs_to :employer

  has_many :locatings
  has_many :locations, :through => :locatings

  has_many :follows
  has_many :comments

  include PositionAssignment
  include EmployerAssignment
  include AASM

  aasm do
    state :OPEN, :initial => true
    state :CLOSE

    event :terminate do
      transitions :from => :OPEN, :to => :CLOSE
    end
  end

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def as_indexed_json(options={})
    self.as_json( :include => [:position, :employer, :locations] )
  end

  def find_by_follow(user)
    self.follows.where( :user => user ).first
  end

  def all_locations=(names)
    self.locations = names.split(",").map do |name|
        Location.where(name: name.strip).first_or_create!
    end
  end

  def all_locations
    self.locations.map(&:name).join(", ")
  end

  def self.located_with(name)
    Location.find_by_name!(name).jobs
  end

end
