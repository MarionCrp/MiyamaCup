class Admin::ShiaiCategoriesController < AdminController
  before_action :find_shiai_category, only: [:edit, :update, :toggle_enabled]

  def index
    @shiai_categories = @cup.shiai_categories.order(title: :asc)
  end

  def new
    @shiai_category = @cup.shiai_categories.build
  end

  def create
    @shiai_category = @cup.shiai_categories.build(shiai_category_params)
    if @shiai_category.save
      flash[:success] = "Le type de compétition a été enregistré avec succès"
      redirect_to admin_cup_shiai_categories_path(cup_id: @cup.id)
    else
      flash[:error] = "Une erreur est survenue lors de la création du type de compétition"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @shiai_category.update_attributes(shiai_category_params)
      flash[:success] = "La catégorie a été modifiée avec succès"
      redirect_to admin_cup_shiai_categories_path(cup_id: @cup.id)
    else
      flash[:error] = "Une erreur est survenue lors de la modification de la catégorie"
      render :edit
    end
  end

  def toggle_enabled
    display_new_state = @shiai_category.enabled? ? "désactivée" : "activée"
    if @shiai_category.toggle!(:enabled)
      flash[:success] = "La catégorie a été #{display_new_state} avec succès"
    else
      flash[:error] = "Une erreur est survenue. La catégorie n'a pas pu être #{display_new_state}"
    end
    redirect_to admin_cup_shiai_categories_path(cup_id: @cup.id)
  end

  private

  def find_shiai_category
    @shiai_category = @cup.shiai_categories.find(params[:id])
  end

  def shiai_category_params
    params.require(:shiai_category).permit(:title, :description, :day, :gender, :fees, :team, :enabled)
  end
end
