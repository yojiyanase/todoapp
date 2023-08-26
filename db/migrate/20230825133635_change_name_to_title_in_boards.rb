class ChangeNameToTitleInBoards < ActiveRecord::Migration[6.0]
  def change
    rename_column :boards, :name, :title
  end
end
