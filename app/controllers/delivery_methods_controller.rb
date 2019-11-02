class DeliveryMethodsController < ApplicationController
  def search
    @alreadys = DeliveryMethod.find_all_by_type(3)
    @methods = DeliveryMethod.find_all_by_type(params[:burden_id].to_i)

    @alreadys.push(@methods)
    @alreadys.flatten!
    respond_to do |format|
      format.html
      format.json {
        @alreadys
      }
    end
  end
end