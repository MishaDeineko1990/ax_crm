class OueOrganization < ApplicationRecord
  has_many :user_oue_organizations, dependent: :destroy
  has_many :users, through: :user_oue_organizations
end
