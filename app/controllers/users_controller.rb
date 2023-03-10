class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @clinicals = @user.clinicals
    @clinical = Clinical.new
    
    #DM機能
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
  
  def index
  @clinicals = current_user.clinicals.page(params[:page]).per(5)
  
  end
  
  def favorites
    @user = User.find(params[:id])
    @clinicals = current_user.clinicals.page(params[:page]).per(5)
    favorites= Favorite.where(user_id: @user.id).pluck(:clinical_id)
    @favorite_clinicals = Clinical.find(favorites)
  end
  

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
       render "edit"
    end
  end  
  
    private

 def user_params
    params.require(:user).permit(:age, :high, :weight, :chronic, :name, :introduction, :profile_image)
 end
    
   def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end  
   end
 
end