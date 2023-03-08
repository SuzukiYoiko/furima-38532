class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def edit
  end

  def update
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit
      end
  end

  def show
  end

  def destroy
      if @item.destroy
        redirect_to root_path
      else
        render :show
      end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :concept, :category_id, :condition_id, :product_price, :charge_price_id, :deadline_id, :area_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id && @item.record.nil?
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
