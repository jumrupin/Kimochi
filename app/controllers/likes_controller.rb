class LikesController < ApplicationController
  def create
    @likes = current_user.likes.create(supply_id: params[:supply_id])
    redirect_to supply_path(params[:supply_id])
  end

  def destroy
    @like = Like.find_by(supply_id: params[:supply_id], user_id: current_user.id)
    @like.destroy
    redirect_to supply_path(params[:supply_id])
  end
end
