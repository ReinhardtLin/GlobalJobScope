module EmployerAssignment

  def employer_name
    self.employer.try(:name)
  end

  def employer_name=(employer_name)
    employer = Employer.where(name: employer_name.strip).first_or_create
    self.employer = employer
  end
end