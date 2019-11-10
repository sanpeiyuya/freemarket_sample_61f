class CreateFinishedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :finished_items do |t|
      t.references :display_item,    foreign_key: true
      t.references :buyer, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
