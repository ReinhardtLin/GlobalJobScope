module PositionAssignment

  def position_name
    self.position.try(:name)
  end

  def position_name=(position_name)
    position = Position.where(name: position_name.strip).first_or_create
    self.position = position
  end
end