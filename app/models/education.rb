class Education < ActiveRecord::Base
  validates_associated :degree
  validates_associated :institute

  belongs_to :user
  belongs_to :current
  belongs_to :degree
  belongs_to :institute

  has_many :educatings
  has_many :locations, :through => :educatings
  has_many :majorings
  has_many :professions, :through => :majorings

  def degree_name
    self.degree.try(:name)
  end

  def degree_name=(degree_name)
    degree = Degree.where(name: degree_name.strip).first_or_create!
    self.degree = degree
  end

  def institute_name
    self.institute.try(:name)
  end

  def institute_name=(institute_name)
    institute = Institute.where(name: institute_name.strip).first_or_create!
    self.institute = institute
  end

  def all_locations=(names)
    self.locations = names.split(",").map do |name|
        Location.where(name: name.strip).first_or_create!
    end
  end

  def all_locations
    self.locations.map(&:name).join(", ")
  end

  def self.educated_with(name)
    Location.find_by_name!(name).educations
  end

  def all_professions=(names)
    self.professions = names.split(",").map do |name|
        Profession.where(name: name.strip).first_or_create!
    end
  end

  def all_professions
    self.professions.map(&:name).join(", ")
  end

  def self.majored_with(name)
    Profession.find_by_name!(name).educations
  end
end
