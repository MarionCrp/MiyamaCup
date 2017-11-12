class UserProfile < ApplicationRecord

  # CONFIGURATION ###########################
  enum genders: {
    female: 0,
    male: 1
  }.freeze

  enum grades: {
    'no_grade' => 0,
    '6_kyu' => 1,
    '5_kyu' => 2,
    '4_kyu' => 3,
    '3_kyu' => 4,
    '2_kyu' => 5,
    '1_kyu' => 6,
    '1_dan' => 7,
    '2_dan' => 8,
    '3_dan' => 9,
    '4_dan' => 10,
    '5_dan' => 11,
    '6_dan' => 12,
    '7_dan' => 13,
    '8_dan' => 14
  }.freeze

  # ASSOCIATIONS ############################
  belongs_to :user



  # CALLBACKS ##################################
  validates :firstname, :lastname, presence: true

  # SCOPES ###################################
  scope :main_profile, -> {
    where(is_main_profile: true)
  }

  scope :child_profiles, -> {
    where(is_main_profile: false)
  }

  scope :disabled, -> {
    where(disabled: true)
  }

  scope :enabled, -> {
    where(disabled: false)
  }
end
