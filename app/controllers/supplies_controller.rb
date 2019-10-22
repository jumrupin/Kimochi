class SuppliesController < ApplicationController

  def index
    @supplies = Supply.search(params[:search])
  end


  def show
    @supply = Supply.find(params[:id])
    @comments = @supply.comments.all
    @comment = Comment.new
  end

  def create
    @supply = Supply.new(supply_params)
    @supply.user_id = current_user.id
    @supply.save!
    redirect_to user_path(current_user.id)
  end

  def edit
    @supply = Supply.find(params[:id])
  end

  def update
    @supply = Supply.find(params[:id])
    @supply.update(supply_params)
    redirect_to supply_path(@supply.id)
  end

  def destroy
  end

  def new
    @supply = Supply.new
  end

private
  def supply_params
    params.require(:supply).permit(:title, :size, :shipping_preparation_period, :condition, :comment, :sales_status, images_attributes:[:id, :_destroy, :supply_id, :supply_image], appointments_attributes:[:id, :_destroy, :supply_id, :category_id, category_attributes:[
      :id, :_destroy, :category_name]])
  end
end
