class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  layout "admin"

  before_action :authenticate_admin!
  before_action :find_cup

  private

  def find_cup
    @cup = Cup.first
  end

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
