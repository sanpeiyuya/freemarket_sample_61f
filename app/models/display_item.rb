class DisplayItem < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
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

  accepts_nested_attributes_for :images

  def previous
    DisplayItem.where("id < ?", self.id).order("id DESC").first
  end

  def next
    DisplayItem.where("id > ?", self.id).order("id ASC").first
  end
end
