class ChangeNameToContentInBoards < ActiveRecord::Migration[6.0]
  def change
    rename_column :boards, :description, :content
  end
end
