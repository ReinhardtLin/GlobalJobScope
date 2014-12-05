class Speaking < ActiveRecord::Base

  belongs_to :user
  belongs_to :language

  LEVEL = ["Basic", "Communication", "Proficient",  "Native"]

  def language_name
    self.language.try(:name)
  end

  def language_name=(language_name)
    language = Language.where(name: language_name.strip).first_or_create!
    self.language = language
  end

end
