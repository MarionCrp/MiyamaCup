class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  layout "admin"

  before_action :find_cup

  private

  def find_cup
    @cup = Cup.first
  end
end
