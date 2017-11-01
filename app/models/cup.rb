class Cup < ApplicationRecord

  # Configurations =============================================================
  translates :title, :description, accessors: I18n.available_locales

  # Associations ===============================================================
  has_many :shiai_categories

  # Callbacks ==================================================================

  validates :title_fr, :title_en, :start_at, :end_at, presence: true
  validate :validate_dates

  # Scopes =====================================================================

  # Class Methods ==============================================================

  # Instance Methods ===========================================================

  private #=====================================================================

  def validate_dates
    if start_at < Time.zone.today || end_at < Time.zone.today || start_at >= end_at
      errors.add(:base, I18n.t('activerecord.errors.models.cup.dates.invalid'))
    end
  end
end
