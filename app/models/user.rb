class User < ActiveRecord::Base

  validates_presence_of :username
  validates_presence_of :email

  has_many :jobs
  has_many :follows
  has_many :following_jobs, :through => :follows, :source => :job

  has_many :comments

  has_many :livings
  has_many :living_countries, :through => :livings, :source => :country

  has_many :visas
  has_many :visa_countries, :through => :visas, :source => :country

  has_many :stayings
  has_many :locations, :through => :stayings

  belongs_to :gender
  has_many :experiences
  has_many :educations

  has_many :speakings
  has_many :languages, :through => :speakings

  accepts_nested_attributes_for :speakings, allow_destroy: true, reject_if: Proc.new{ |attrs| attrs['language_name'].blank? }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def display_name
    self.name
  end

  def set_admin!
    self.role = "admin"
    self.save!
  end

  def admin?
    self.role == "admin"
  end

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  def all_locations=(names)
    self.locations = names.split(",").map do |name|
        Location.where(name: name.strip).first_or_create!
    end
  end

  def all_locations
    self.locations.map(&:name).join(", ")
  end

  def self.stayed_with(name)
    Location.find_by_name!(name).users
  end

  def all_countries=(names)
    self.living_countries = names.split(",").map do |name|
        Country.where(name: name.strip).first_or_create!
    end
  end

  def all_countries
    self.living_countries.map(&:name).join(", ")
  end

  def self.lived_with(name)
    Country.find_by_name!(name).users
  end

  def all_eligibles=(names)
    self.visa_countries = names.split(",").map do |name|
        Country.where(name: name.strip).first_or_create!
    end
  end

  def all_eligibles
    self.visa_countries.map(&:name).join(", ")
  end

  def self.visaed_with(name)
    Country.find_by_name!(name).users
  end
end
