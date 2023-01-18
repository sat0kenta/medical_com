class ClinicalsController < ApplicationController
  def new
    @clinicals = Clinical.all
    @clinical = Clinical.new
  end

  def index
    @clinicals = Clinical.all
    @clinical = Clinical.new
    @user=current_user
  end

  def show
    #@clinicals = Clinical.all
    @clinical = Clinical.find(params[:id])
    #@new_clinical = Clinical.new
    @user = @clinical.user
  end
    
  def create
    @clinical = Clinical.new(clinical_params)
    @clinical.user_id = current_user.id
    if @clinical.save
      redirect_to clinical_path(@clinical), notice: "You have created case successfully."
    else
      @clinicals = Clinical.all
      render 'index'
    end
  end
  
private 

def clinical_params  
   params.require(:clinical).permit(:title, :body, :drug, :ope, :progress) 
end
  
  
end
