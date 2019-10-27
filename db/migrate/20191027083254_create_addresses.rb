class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references  :user,                   foreign_key: true
      t.string      :postal_code,            null: false
      t.integer     :prefecture_id,          null: false
      t.string      :block,                  null: false
      t.string      :building
      t.string      :phone
      t.timestamps
    end
  end
end