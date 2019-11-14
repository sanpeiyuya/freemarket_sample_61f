class AddressesController < ApplicationController
  
  def edit
    @address = current_user.address
  end

  def update
    @address = current_user.address
    
    if @address.update(address_params)
      redirect_to mypages_path
    end    
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id,:city,:block,:building)
  end
end

