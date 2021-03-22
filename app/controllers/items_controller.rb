class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params, only: [:show, :edit, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    if current_user.id == @item.user.id
     @item.destroy
     redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :information, :item_status_id, :category_id, :inner_diameter_id, :outer_diameter_id, :image).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end
end
