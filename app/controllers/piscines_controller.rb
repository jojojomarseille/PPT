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

  def new
    @piscine = current_user.piscines.build
  end

  def create
    @piscine = current_user.piscines.build(piscine_params)
  
    if @piscine.save
      redirect_to @piscine, notice: 'Piscine créée avec succès.'
    else
      render :new
    end
  end

  def destroy
    # load existing object again from URL param
    piscine = Piscine.find(params[:id])
    # destroy object
    piscine.destroy
    # respond_to block
    respond_to do |format|
        format.html do
            # success message
            flash[:success] = 'Piscine removed successfully'
            # redirect to index
            redirect_to root_path
        end
    end
end

def edit
  @piscine = Piscine.find(params[:id])
  respond_to do |format|
      format.html { render :edit, locals: { piscine: @piscine } }
  end
end

# def update
#   # load existing object again from URL param
#   @piscine = Piscine.find(params[:id])
#   # respond_to block
#   respond_to do |format|
#       format.html do
#           if @piscine.update(params.require(:piscine).permit(:name, :adress, :cp, :ville, :pays, :mail, :tel, :user, :mondaystart, :mondayend, :tuesdaystart, :tuesdayend, :wednesdaystart, :wednesdayend, :thursdaystart, :thursdayend, :fridaystart, :fridayend, :saturdaystart, :saturdayend, :sundaystart, :sundayend))
#               # success message
#               flash[:success] = 'Piscine updated successfully'
#               # redirect to index
#               redirect_to root_path
#           else
#               # error message
#               flash.now[:error] = 'Error: Piscine could not be updated'
#               # render edit
#               render :edit, locals: { piscine: @piscine }
#           end
#       end
#   end
# end

def update
  @piscine = Piscine.find(params[:id])

  if @piscine.update(piscine_params)
    redirect_to @piscine
  else
    flash.now[:error] = 'Error: Piscine could not be updated'
    render 'edit'
  end
end


private
 
  def piscine_params
    params.require(:piscine).permit(:name, :adress, :cp, :ville, :pays, :mail, :tel, :mondaystart, :mondayend, :tuesdaystart, :tuesdayend, :wednesdaystart, :wednesdayend, :thursdaystart, :thursdayend, :fridaystart, :fridayend, :saturdaystart, :saturdayend, :sundaystart, :sundayend, :image)
  end
end
