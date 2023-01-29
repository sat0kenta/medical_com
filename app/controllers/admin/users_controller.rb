class Admin::UsersController < ApplicationController
    
    def index
    @users = User.all
    @clinicals = Clinical.page(params[:page]).per(5)
    #@clinicals = Clinical.all
    #@clinical = Clinical.new
   # @user=current_user
    end
    
    def show
    @user = User.find(params[:id])
    @clinicals = @user.clinicals
    @clinical = Clinical.new
    end
    
    def update
    @user = User.find(params[:id])
    if @user.is_active
        @user.update(is_active: false)
    else
         @user.update(is_active: true)
    end
    @users = User.all
    @clinicals = Clinical.page(params[:page]).per(5)
    render :index
    end
    
    def user_params
    params.require(:user).permit(:age, :high, :weight, :chronic, :name, :introduction, :profile_image, :is_active)
    end
    
end