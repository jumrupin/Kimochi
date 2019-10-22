class AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses.all
    @address = Address.new
  end

  def create
    @address = Address.new(params_address)
    @address.user_id = current_user.id
    @address.save
    redirect_to user_addresses_path(current_user)
  end

  def destroy
    @address = current_user.addresses.find(params[:id])
    @address.destroy
    redirect_to user_addresses_path(current_user)
  end

  def edit
    @address = current_user.addresses.find(params[:id])
  end

  def update
    @address = current_user.addresses.find(params[:id])
    @address.update(params_address)
    redirect_to user_addresses_path(current_user)
  end

  private
  def params_address
    params.require(:address).permit(:postal_code, :prefecture, :municipal_district, :after_address)
  end

end
