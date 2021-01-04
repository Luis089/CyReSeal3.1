class User < ApplicationRecord
    rolify
    after_create :assign_default_role
    has_many :attempts, dependent: :destroy
    has_many :quizzes, through: :attempts
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable


  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous"
  end

  def assign_default_role
    self.add_role(:Kunde) if self.roles.blank?
  end
end
