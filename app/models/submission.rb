class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  include AASM

  aasm do
    # state :expecting, :initial => true
    state :applying, :initial => true
    state :admitted
    state :confirmed
    state :rejected
    state :declined

    # event :apply do
    #   transitions :from => :expecting, :to => :applying
    # end

    event :admit do
      transitions :from => :applying, :to => :admitted
    end

    event :confirm do
      transitions :from => :admitted, :to => :confirmed
    end

    event :reject do
      transitions :from => :applying, :to => :rejected
    end

    event :decline do
      transitions :from => :admitted, :to => :declined
    end

    event :emphasize do
      transitions :from => :declined, :to => :admitted
    end

    event :refuse do
      transitions :from => :declined, :to => :rejected
    end
  end

  def display_status
    self.aasm_state.upcase
  end
end
