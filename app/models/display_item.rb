class DisplayItem < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # バリデーション
  validates :name,          presence: true
  validates :name,          length: { in: 1..40 }
  validates :description,   presence: true
  validates :description,   length: { in: 1..1000 }
  validates :category_id,   presence: true
  validates :size_id,       presence: true, if: :category_has_size?
  validates :condition_id,  presence: true
  validates :delivery_fee_burden_id,  presence: true
  validates :delivery_method_id,  presence: true
  validates :prefecture_id,  presence: true
  validates :delivery_by_day_id,  presence: true
  validates :price,         numericality: {only_integer: true, greater_than: 299, less_than: 10000000}
  validates_associated :images

  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee_burden
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :delivery_by_day

  belongs_to :user
  belongs_to :category
  belongs_to :size, optional: true
  belongs_to :brand, optional: true

  has_many :images, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  has_one :trading_item, dependent: :destroy
  has_one :finished_item, dependent: :destroy
  has_one :stopping_item, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  def category_has_size?
    if category_id
      Category.find(category_id).size_id != nil
    end
  end

  def previous
    DisplayItem.where("id < ?", self.id).order("id DESC").first
  end

  def next
    DisplayItem.where("id > ?", self.id).order("id ASC").first
  end
end
