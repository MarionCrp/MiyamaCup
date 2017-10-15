class Admin::ShiaiCategoriesController < AdminController
  before_action :find_cup
  before_action :find_shiai_category, only: [:edit, :update]

  def index
    @shiai_categories = @cup.shiai_categories
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

  private

  def find_cup
    @cup = Cup.find(params[:cup_id])
  end

  def find_shiai_category
    @shiai_category = @cup.shiai_categories.find(params[:id])
  end

  def shiai_category_params
    params.require(:shiai_category).permit(:title, :description, :day, :gender, :fees, :team)
  end
end
