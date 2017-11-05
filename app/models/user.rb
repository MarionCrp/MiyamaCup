class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_profiles,  dependent: :destroy
  has_one :main_profile, -> { main_profile }, class_name: "UserProfile"
  has_many :child_profiles, -> { child_profiles }, class_name: "UserProfile"
end
