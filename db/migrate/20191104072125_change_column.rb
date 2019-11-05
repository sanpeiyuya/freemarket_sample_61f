class ChangeColumn < ActiveRecord::Migration[5.0]
  def up
    change_column:user_profiles,:last_name,:string
  end

  def down
    change_column:userprofiles,:last_name,:string,default:""
  end

end
