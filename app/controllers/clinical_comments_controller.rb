class ClinicalCommentsController < ApplicationController
 def create
    @clinical = Clinical.find(params[:clinical_id])
		@clinical_comment = ClinicalComment.new(clinical_comment_params)
		@clinical_comment.clinical_id = @clinical.id
		@clinical_comment.user_id = current_user.id
	  @clinical_comment.save
 end

  def destroy
    @clinical = Clinical.find(params[:clinical_id])
  	@clinical_comment = @clinical.clinical_comments.find(params[:id])
		@clinical_comment.destroy
  end
  
  def clinical_comment_params
    params.require(:clinical_comment).permit(:comment)
  end
end
