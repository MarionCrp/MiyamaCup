class ShiaiCategory < ApplicationRecord

  # Configurations =============================================================
  enum genders: {
    mixed: 0,
    female: 1,
    male: 2,
    junior: 3
  }.freeze

  # Associations ===============================================================
  belongs_to :cup
  # has_many :kenshis

  # Callbacks ==================================================================

  validates :title, :day, presence: true
  validate :validate_day, unless: Proc.new { |a| a.day.blank? }

  # Scopes =====================================================================

  # Class Methods ==============================================================

  # Instance Methods ===========================================================

  private #=====================================================================

  def validate_day
    unless day == cup.start_at.to_date || day != cup.end_at.to_date
      errors.add(:day, I18n.t('activerecord.errors.models.shiai_category.day.invalid'))
    end
  end
end
