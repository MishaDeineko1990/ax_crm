class UserOueOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :oue_organization

  # Validation to prevent duplicate associations
  validates :user_id, uniqueness: { scope: :oue_organization_id }
end