require 'rails_helper'

describe DisplayItemsController do

  describe 'Delete#destroy' do
    it 'redirect_to_302' do
      display_item = create(:display_item)
      delete :destroy, params: {id: display_item}
      expect(response.status).to eq 302
    end
    it 'delete_display_item' do
      display_item = create(:display_item)
      expect{delete :destroy, params: {id: display_item}}.to change(DisplayItem, :count).by(-1)
    end
  end

end