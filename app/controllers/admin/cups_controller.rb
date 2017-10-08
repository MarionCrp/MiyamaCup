class Admin::CupsController < AdminController
  before_action :find_cup, only: [:update]

  def edit
    @cup = Cup.first
  end

  def update
    if @cup.update_attributes(cup_params)
      flash[:success] = "La compétition a été modifiée avec succès"
      redirect_to edit_admin_cup_path(@cup)
    else
      flash[:error] = "Une erreur est survenue lors de la modification de la compétition"
      render :edit
    end
  end

  private

  def find_cup
    @cup = Cup.find(params[:id])
  end

  def cup_params
    params.require(:cup).permit(:title, :description, :start_at, :end_at)
  end
end
