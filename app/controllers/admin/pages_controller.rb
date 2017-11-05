class Admin::PagesController < AdminController
  before_action :find_page, only: [:edit, :update, :toggle_visible]

  def index
    @pages = @cup.pages
    if params[:redordered].present?
      @pages = @pages.order(visible: :asc, title: :asc)
    end
  end

  def new
    @page = @cup.pages.build
  end

  def create
    @page = @cup.pages.build(page_params)
    @page.param = params[:page][:param].split(' ').join('_').downcase
    if @page.save
      flash[:success] = "Le type de compétition a été enregistré avec succès"
      redirect_to admin_cup_pages_path(cup_id: @cup.id)
    else
      flash[:error] = "Une erreur est survenue lors de la création du type de compétition"
      render 'new', status: 422
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(page_params)
      flash[:success] = "La catégorie a été modifiée avec succès"
      redirect_to admin_cup_pages_path(cup_id: @cup.id)
    else
      flash[:error] = "Une erreur est survenue lors de la modification de la catégorie"
      render :edit, status: 422
    end
  end

  def toggle_visible
    if @page.toggle!(:visible)
      flash[:success] = @page.visible? ? "La page est désormais visible" : "La page n'est plus visible"
    else
      error = @page.visible? ? "La page est toujours visible" : "La page n'est pas visible"
      flash[:error] = "Une erreur est survenue. #{error}"
    end
    redirect_to admin_cup_pages_path(cup_id: @cup.id, reordered: false)
  end

  private

  def find_page
    @page = @cup.pages.find(params[:id])
  end

  def page_params
    translated_params = translate_params(:title, :content)
    parameters = [:position, :visible, *translated_params]
    parameters << [:param] if params[:action] == 'new'
    parameters = params.require(:page).permit(*parameters)
  end
end
