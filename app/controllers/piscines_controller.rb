class PiscinesController < ApplicationController
  include Pagy::Backend

  def show
    @piscine = Piscine.find(params[:id])
  end

  def index
    # @piscines = Piscine.all
    @pagy, @piscines = pagy(Piscine.all)
  end

  def index_perso
    @pagy, @piscines = pagy(Piscine.where(user: current_user))
  end

  def create
    @piscine = Piscine.new(piscine_params)
    if @piscine.save
      redirect_to @piscine
    else
      render 'new'
    end
  end

  def new
    @piscine = Piscine.new
  end

private
 
  def piscine_params
    params.require(:piscine).permit(:name, :adress, :cp, :ville, :pays, :mail, :tel, :user, :mondaystart, :mondayend, :tuesdaystart, :tuesdayend, :wednesdaystart, :wednesdayend, :thursdaystart, :thursdayend, :fridaystart, :fridayend, :saturdaystart, :saturdayend, :sundaystart, :sundayend)
  end
end
