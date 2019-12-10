class HistoriesController < ApplicationController
  def new
    @supply = Supply.find(params[:supply_id])
    @history = History.new
  end

  def create
    @supply = Supply.find(params[:supply_id])
    @supply.sales_status = '売り切れ'
    @supply.save
    p @supply
    @history = History.new(history_params)
    @history.supporter_id = @supply.user.id
    @history.victim_id = current_user.id
    @history.supply_id = @supply.id
    @history.save
    redirect_to supply_thanks_path
  end

  def thank
  end

  def receipt
    @histories_passive = current_user.passive_histories.all
    @histories_active = current_user.active_histories.all
  end

  def label
    @history = History.find(params[:hisotories_id])
  end

  def receipt_status
    @history = History.find(params[:id])
    @history.update(history_params)
    redirect_to supply_receipt_path(current_user.id)
  end

private
  def history_params
    params.require(:history).permit(:shipping, :receipt_status)
  end

  def supply_params
    params.require(:supply).permit(:title, :size, :shipping_preparation_period, :condition, :comment, :sales_status, images_attributes:[:id, :_destroy, :supply_id, :supply_image], appointments_attributes:[:id, :_destroy, :supply_id, :category_id, category_attributes:[
      :id, :_destroy, :category_name]])
  end

end
