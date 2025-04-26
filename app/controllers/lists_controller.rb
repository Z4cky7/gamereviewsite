class ListsController < ApplicationController
  def new
    @list = List.new
    @lists = List.all
  end
  
  def create
    @list = List.new(list_params)
    @list.user_id=current_user.id
    if @list.save
      flash[:nitice] = "投稿完了しました。"
    redirect_to list_path(@list.id)
    else
      @lists = List.all
      render :index
    end
  end

  def index
    
    @lists = List.all
    @list  =List.new
  end

  def show
    @list = List.find(params[:id]) 
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "編集完了しました。"
    redirect_to list_path(@list.id)  
    else
      @lists = List.all
      render :edit
    end
  end
  
  def destroy
    list = List.find(params[:id])  
    list.destroy  
    redirect_to '/lists'  
    flash[:notice] = "削除完了しました。"
  end
  
  private 
  def list_params
    params.require(:list).permit(:title,:body)
  end
  
end
