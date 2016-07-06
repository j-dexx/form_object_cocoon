class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :task_list, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
