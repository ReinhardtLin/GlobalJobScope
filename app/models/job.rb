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
  has_many :submissions

  include PositionAssignment
  include EmployerAssignment
  include AASM

  aasm do
    state :open, :initial => true
    state :closed

    event :terminate do
      transitions :from => :open, :to => :closed
    end
  end

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def can_modify_by?(user)
    (self.user == user )
  end

  def display_status
    self.aasm_state.upcase
  end

  def as_indexed_json(options={})
    self.as_json( :include => [:position, :employer, :locations] )
  end

  def find_by_follow(user)
    self.follows.where( :user => user ).first
  end

  def find_by_submission(user)
    self.submissions.where( :user => user ).first
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
