class Page < ApplicationRecord

  # Configurations =============================================================
  translates :title, :content, accessors: I18n.available_locales

  # Associations ===============================================================
  belongs_to :cup

  # Callbacks ==================================================================

  validates :title_fr, :title_en, :param, presence: true

  # Scopes =====================================================================

  # Class Methods ==============================================================

  # Instance Methods ===========================================================

  private #=====================================================================
end
