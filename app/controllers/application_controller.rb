class ApplicationController < BaseController
  layout "application"

  before_action :find_pages
  before_action :find_home_page

  private

  def find_pages
    @pages = @cup.pages.visible.order(:position)
  end

  def find_home_page
    @home_page = @pages.first
  end
end
