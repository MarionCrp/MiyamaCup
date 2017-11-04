class UserProfile < ApplicationRecord
  belongs_to :user
  validates :firstname, :lastname, presence: true
end
