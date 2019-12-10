class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = current_user.lists.all
  end

  def create

    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.save!
    redirect_to lists_path(current_user)

  end

  private
    def list_params
      params.require(:list).permit(:user_id, :want)
    end
end
