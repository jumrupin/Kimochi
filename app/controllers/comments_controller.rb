class CommentsController < ApplicationController
  def show
  end

  def create
    @supply = Supply.find(params[:supply_id])
    @comment = current_user.comments.new(comment_params)
    @comment.supply_id = @supply.id
    @comment.save
    redirect_to supply_path(@supply.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :supply_id)
  end
end
