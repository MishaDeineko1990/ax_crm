class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :organization, optional: true
  belongs_to :oue_organization, optional: true
  belongs_to :persson, optional: true
  has_many :goods, dependent: :destroy
end

