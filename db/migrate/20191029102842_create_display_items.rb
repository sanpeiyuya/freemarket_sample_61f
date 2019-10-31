class CreateDisplayItems < ActiveRecord::Migration[5.0]
  def change
    create_table :display_items do |t|
      t.string      :name,                    null: false, index:true
      t.text        :description,             null: false
      t.integer     :price,                   null: false
      t.references  :category,                foreign_key: true
      t.references  :size,                    foreign_key: true
      t.references  :brand,                   foreign_key: true
      t.integer     :condition_id,            null: false
      t.integer     :delivery_fee_burden_id,  null: false
      t.integer     :delivery_method_id,      null: false
      t.integer     :prefecture_id,           null: false
      t.integer     :delivery_by_day_id,      null: false
      t.references  :user,                    null:false, foreign_key: true
      t.timestamps
    end
  end
end
