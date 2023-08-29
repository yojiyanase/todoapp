class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.date :limit
      t.timestamps
    end
  end
end
