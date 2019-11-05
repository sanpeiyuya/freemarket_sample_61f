class ChangeDataOptionColumn < ActiveRecord::Migration[5.0]
  def up
    change_column :addresses,:postal_code,:string,null: true
    change_column :addresses,:prefecture_id,:integer,null: true
    change_column :addresses,:block,:string,null: true
  end

  def down
    change_column :addresses,:postal_code,:string,null: false 
    change_column :addresses,:prefecture_id,:integer,null: false
    change_column :addresses,:block,:string,null: false
  end

end
