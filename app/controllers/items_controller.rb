class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    params.permit!
    if Item.create(params[:item])
      redirect_to items_path
    else
      render "new"   
    end
  end  

  def edit
    @item = Item.find(params[:id])
  end

  def update
    params.permit!
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to @item
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

    def item_params
      params.require(:item).permit(:title, :description)
    end
end
