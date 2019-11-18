require 'rails_helper'

describe DisplayItem do
  describe '#create' do
    it "「name」抜きでは商品が作れない" do
      category = create(:category)
      # カテゴリが必要なので作る
      display_item = build(:display_item, category_id: category.id, name: "")
      display_item.valid?
      expect(display_item.errors[:name]).to include("を入力してください")
    end
  end

  describe '#destroy' do
    it 'redirect_to_302' do
      user = create(:user)
      category = create(:category)
      # カテゴリとユーザーが必要なので作る
      display_item = create(:display_item, category_id: category.id, user_id: user.id, brand_id: "", size_id: "")
      expect{ display_item.destroy }.to change{ DisplayItem.count }.by(-1)
    end
  end

end