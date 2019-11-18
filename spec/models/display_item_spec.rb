require 'rails_helper'

describe DisplayItem do
  describe '#create' do
    it "「name」なしで商品は作れない" do
      size = create(:size)
      category = create(:category, size_id: size.id)
      # カテゴリが必要なので作る
      display_item = build(:display_item, category_id: category.id, name: "")
      display_item.valid?
      expect(display_item.errors[:name]).to include("を入力してください")
    end

    it "「name」が41文字で商品が作れない" do
      size = create(:size)
      category = create(:category, size_id: size.id)
      # カテゴリが必要なので作る
      display_item = build(:display_item, category_id: category.id, name: "あいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこを")
      display_item.valid?
      expect(display_item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "「description」なしで商品は作れない" do
      size = create(:size)
      category = create(:category, size_id: size.id)
      # カテゴリが必要なので作る
      display_item = build(:display_item, category_id: category.id, description: "")
      display_item.valid?
      expect(display_item.errors[:description]).to include("を入力してください")
    end

    it "「description」が1001文字で商品が作れない" do
      size = create(:size)
      category = create(:category, size_id: size.id)
      # カテゴリが必要なので作る
      display_item = build(:display_item, category_id: category.id, description: "あああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいあああああいいいいいう")
      display_item.valid?
      expect(display_item.errors[:description]).to include("は1000文字以内で入力してください")
    end

    it "「category_id」なしで商品は作れない" do
      size = create(:size)
      category = create(:category, size_id: size.id)
      # カテゴリが必要なので作る
      display_item = build(:display_item, category_id: "")
      display_item.valid?
      expect(display_item.errors[:category_id]).to include("を入力してください")
    end

    it "「size_id」なしで商品は作れない //カテゴリーidにsize_idがある時" do
      size = create(:size)
      category = create(:category, size_id: size.id)
      # カテゴリが必要なので作る
      display_item = build(:display_item, category_id: category.id, size_id: "")
      display_item.valid?
      expect(display_item.errors[:size_id]).to include("を入力してください")
    end

    it "「condition_id」なしで商品は作れない" do
      size = create(:size)
      category = create(:category, size_id: size.id)
      # カテゴリが必要なので作る
      display_item = build(:display_item, category_id: category.id, condition_id: "")
      display_item.valid?
      expect(display_item.errors[:condition_id]).to include("を入力してください")
    end

  it "「delivery_fee_burden_id」なしで商品は作れない" do
    size = create(:size)
    category = create(:category, size_id: size.id)
    # カテゴリが必要なので作る
    display_item = build(:display_item, category_id: category.id, delivery_fee_burden_id: "")
    display_item.valid?
    expect(display_item.errors[:delivery_fee_burden_id]).to include("を入力してください")
  end

  it "「delivery_method_id」なしで商品は作れない" do
    size = create(:size)
    category = create(:category, size_id: size.id)
    # カテゴリが必要なので作る
    display_item = build(:display_item, category_id: category.id, delivery_method_id: "")
    display_item.valid?
    expect(display_item.errors[:delivery_method_id]).to include("を入力してください")
  end

  it "「prefecture_id」なしで商品は作れない" do
    size = create(:size)
    category = create(:category, size_id: size.id)
    # カテゴリが必要なので作る
    display_item = build(:display_item, category_id: category.id, prefecture_id: "")
    display_item.valid?
    expect(display_item.errors[:prefecture_id]).to include("を入力してください")
  end

  it "「delivery_by_day_id」なしで商品は作れない" do
    size = create(:size)
    category = create(:category, size_id: size.id)
    # カテゴリが必要なので作る
    display_item = build(:display_item, category_id: category.id, delivery_by_day_id: "")
    display_item.valid?
    expect(display_item.errors[:delivery_by_day_id]).to include("を入力してください")
  end

  it "「price」が数値ではないと商品は作れない" do
    size = create(:size)
    category = create(:category, size_id: size.id)
    # カテゴリが必要なので作る
    display_item = build(:display_item, category_id: category.id, price: "あいうえお")
    display_item.valid?
    expect(display_item.errors[:price]).to include("は数値で入力してください")
  end

  it "「price」が299円だと商品は作れない" do
    size = create(:size)
    category = create(:category, size_id: size.id)
    # カテゴリが必要なので作る
    display_item = build(:display_item, category_id: category.id, price: 299)
    display_item.valid?
    expect(display_item.errors[:price]).to include("は299より大きい値にしてください")
  end

  it "「price」が10000000円だと商品は作れない" do
    size = create(:size)
    category = create(:category, size_id: size.id)
    # カテゴリが必要なので作る
    display_item = build(:display_item, category_id: category.id, price: 10000000)
    display_item.valid?
    expect(display_item.errors[:price]).to include("は10000000より小さい値にしてください")
  end
end




  describe '#destroy' do
    it 'display_itemのレコードを削除できるか' do
      user = create(:user)
      size = create(:size)
      category = create(:category, size_id: size.id)
      # カテゴリとユーザーが必要なので作る
      display_item = create(:display_item, category_id: category.id, size_id: size.id, user_id: user.id, brand_id: "")
      expect{ display_item.destroy }.to change{ DisplayItem.count }.by(-1)
    end
  end

end