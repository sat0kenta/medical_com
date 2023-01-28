class ClinicalsController < ApplicationController

  def new
    @clinicals = Clinical.all
    @clinical = Clinical.new
  end

  def index
    @clinicals = Clinical.page(params[:page]).per(5)
    #@clinicals = Clinical.all
    @clinical = Clinical.new
    @user=current_user
    
  end
  
  
  def edit
    @clinical = Clinical.find(params[:id])
  end
  
  def update
    @clinical = Clinical.find(params[:id])
    if @clinical.update(clinical_params)
      redirect_to clinical_path(@clinical), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end
  
  def show
    @clinical = Clinical.find(params[:id])
    @user = @clinical.user
    @clinical_comment = ClinicalComment.new
    #@clinicals = Clinical.all
    
    #@new_clinical = Clinical.new
    
  end
    
  def create
    @clinical = Clinical.new(clinical_params)
    @clinical.user_id = current_user.id
    if @clinical.save
      redirect_to clinical_path(@clinical), notice: "You have created case successfully."
    else
      render 'new'
    end
  end
  
  def destroy
    @clinical = Clinical.find(params[:id])
    @clinical.destroy
    redirect_to clinicals_path
  end
  
  def user_index
    user = User.find(params[:user_id])
    @clinicals = user.clinicals.page(params[:page]).per(5)
  end
  
private 

def clinical_params  
   params.require(:clinical).permit(:title, :body, :drug, :ope, :progress) 
end
end