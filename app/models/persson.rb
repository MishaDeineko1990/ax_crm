class Persson < ApplicationRecord
    belongs_to :user
    belongs_to :organization, optional: true

    validates :first_name, :last_name, presence: true
end
