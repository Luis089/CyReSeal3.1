class User < ApplicationRecord
    has_many :customers
    has_many :quizzes , through: :customers

    validates :nick_name, presence: true, uniqueness: true,:length => {:minimum => 1}
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable


  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous"
  end
end
