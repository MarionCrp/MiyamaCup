class PagesController < ApplicationController

  before_action :find_page

  def show
    if @page.nil?
      redirect_to coming_soon_path
    end
  end

  private

  def find_page
    @page = Page.find_by_id(params[:id]) || @home_page
  end
end
