class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lists = @user.lists.page(params[:page])
    
  
  end

  def edit
  end
end
