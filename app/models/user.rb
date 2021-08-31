class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #We have turn on the timeout => which automatically logs the user out after 2 hours(set it by us), and the trackable
  #module to being able to track users.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeout_in, :trackable
end
