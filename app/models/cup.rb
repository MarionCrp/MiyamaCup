class Cup < ApplicationRecord

  # Configurations =============================================================

  # Associations ===============================================================

  # Callbacks ==================================================================

  validates :title, :start_at, :end_at, presence: true
  validate :validate_dates

  # Scopes =====================================================================

  # Class Methods ==============================================================

  # Instance Methods ===========================================================

  private #=====================================================================

  def validate_dates
    if start_at < Time.zone.today || end_at < Time.zone.today || start_at >= end_at
      errors.add(:base, "Les dates de la compétition doivent être valides")
    end
  end
end
