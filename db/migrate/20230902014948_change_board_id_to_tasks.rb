class AddEyecatchToTasks < ActiveRecord::Migration[6.0]
  def up
    change_column :tasks, :board_id, :integer, null: true
  end

  def down
    change_column :tasks, :board_id, :integer, null: false
  end
end
