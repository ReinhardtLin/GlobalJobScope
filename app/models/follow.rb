class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :job, :counter_cache => true

  def can_delete_by?(user)
    self.user == user
  end
end
