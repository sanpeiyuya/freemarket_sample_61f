class AddressesController < ApplicationController
  
  def edit
    @profile = UserProfile.find(current_user.id)
    @address = current_user.address
    
  end

  def update
    Address.find(params[:id]).update(address_params)
    @address = current_user.address
  end

  private
  binding.pry
  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id,:city,:block,:building)
  end
end

