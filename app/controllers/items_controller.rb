class ItemsController < ApplicationController

before_action  :find_item, only:[:show, :edit,:update, :destroy]

  def index
    @items = Item.all
  end

  def show

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

  end

  def update
    params.permit!
    if @item.update_attributes(params[:item])
      redirect_to @item
    else
      render "edit"
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

    def item_params
      params.require(:item).permit(:title, :description)
    end

      def find_transaction
+      @item = Item.find(params[:id])
+   end
end
