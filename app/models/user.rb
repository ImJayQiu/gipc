class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #
  cattr_accessor :current_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
