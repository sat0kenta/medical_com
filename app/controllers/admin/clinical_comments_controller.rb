class Admin::ClinicalCommentsController < ApplicationController
  def index
    @comments = ClinicalComment.all.page(params[:page]).per(5)
  end
  
  def destroy
    comment = ClinicalComment.find(params[:id])
    comment.destroy
    redirect_to admin_users_path
  end
  
end
