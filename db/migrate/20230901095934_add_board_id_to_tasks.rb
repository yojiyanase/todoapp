class AddBoardIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :board, null: false
  end
  def up
    change_column :tasks, :user_id, :integer, null: false
  end

  def down
    change_column :tasks, :user_id, :integer, null: true
  end
end
