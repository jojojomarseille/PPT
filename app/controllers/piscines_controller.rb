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

# def edit
#   question = McQuestion.find(params[:id])
#   respond_to do |format|
#       format.html { render :edit, locals: { question: question } }
#   end
# end

# def update
#   # load existing object again from URL param
#   question = McQuestion.find(params[:id])
#   # respond_to block
#   respond_to do |format|
#       format.html do
#           if question.update(params.require(:mc_question).permit(:question, :answer, :distractor_1, :distractor_2))
#               # success message
#               flash[:success] = 'Question updated successfully'
#               # redirect to index
#               redirect_to quiz_url(question.quiz)
#           else
#               # error message
#               flash.now[:error] = 'Error: Question could not be updated'
#               # render edit
#               render :edit, locals: { question: question }
#           end
#       end
#   end
# end




private
 
  def piscine_params
    params.require(:piscine).permit(:name, :adress, :cp, :ville, :pays, :mail, :tel, :user, :mondaystart, :mondayend, :tuesdaystart, :tuesdayend, :wednesdaystart, :wednesdayend, :thursdaystart, :thursdayend, :fridaystart, :fridayend, :saturdaystart, :saturdayend, :sundaystart, :sundayend)
  end
end
