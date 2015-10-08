class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # User Roles
  enum role: [:user, :operator, :admin]
  
  # Method to verify if user has the operator or admin role
  def admin_or_operator?
    self.admin? || self.operator?
  end
  
end
