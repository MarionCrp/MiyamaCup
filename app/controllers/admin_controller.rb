class AdminController < BaseController
  layout "admin"

  before_action :authenticate_admin!

  private

  def translate_params(*params)
    translated_params = []
    params.each do |param|
      I18n.available_locales.each do |locale|
        translated_params << "#{param}_#{locale}".to_sym
      end
    end
    translated_params
  end
end
