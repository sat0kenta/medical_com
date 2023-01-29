class Admin::ClinicalsController < ApplicationController
    
    def index
        @clinicals = Clinical.page(params[:page]).per(5)
        #@clinicals = Clinical.all
        @clinical = Clinical.new
        @user=current_user
    
    end
    
end