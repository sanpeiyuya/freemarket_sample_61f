class RenameLastNameKanaColumnToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_profiles, :last_name_kana, :given_name_kana
  end
end
