class Page < ApplicationRecord

  # Configurations =============================================================
  translates :title, :content, accessors: I18n.available_locales

  # Associations ===============================================================
  belongs_to :cup

  # Callbacks ==================================================================

  validates :title_fr, :title_en, :cup, :param, presence: true

  # Scopes =====================================================================
  scope :visible, -> { where(visible: true) }
  # Class Methods ==============================================================

  # Instance Methods ===========================================================

  private #=====================================================================
end
