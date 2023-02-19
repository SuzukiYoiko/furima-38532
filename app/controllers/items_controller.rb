class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new]

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

  # def edit
  # end

  # def update
  # end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :concept, :category_id, :condition_id, :product_price, :charge_price_id, :deadline_id, :area_id, :image).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   @item = Item.find(params[:id])
  #   unless user_signed_in? && current_user.id == @item.user_id
  #     redirect_to action: :index
  #   end
  # end

end
