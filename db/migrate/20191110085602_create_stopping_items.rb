class CreateStoppingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :stopping_items do |t|
      t.references :display_item,    foreign_key: true
      t.timestamps
    end
  end
end
