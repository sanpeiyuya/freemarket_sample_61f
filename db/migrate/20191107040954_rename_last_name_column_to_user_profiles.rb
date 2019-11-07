class RenameLastNameColumnToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_profiles, :last_name, :given_name
  end
end
