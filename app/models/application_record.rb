class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous"
  end
end
