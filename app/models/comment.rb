class Comment < ActiveRecord::Base

  validates_presence_of :content

  belongs_to :user
  belongs_to :job, :counter_cache => true

  def can_delete_by?(user)
    self.user == user
  end

  def notify_followers
    self.job.follows.each do |f|
      if self.user != f.user
        Rails.logger.debug("Send notify to user: #{f.user.id} #{f.user.email}")
        UserMailer.new_comment(f.user, self).deliver
      end
    end
  end
end
