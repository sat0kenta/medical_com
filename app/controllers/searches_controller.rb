class SearchesController < ApplicationController
  def search
    
    @model = params[:model]
    @word = params[:word]
    @search = params[:search]

    if @model == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @clinicals = Clinical.looks(params[:search], params[:word])
    end
  end
end
