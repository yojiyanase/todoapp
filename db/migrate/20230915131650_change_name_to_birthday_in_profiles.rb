class ChangeNameToBirthdayInProfiles < ActiveRecord::Migration[6.0]
  def change
    rename_column :profiles, :birthsay, :birthday
  end
end
