class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :perssons
  has_many :organizations
  has_many :user_oue_organizations, dependent: :destroy
  has_many :oue_organizations, through: :user_oue_organizations
  
  enum role: { user: 0, admin: 1, manager: 2 }
  
end
