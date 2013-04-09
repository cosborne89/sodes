class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :priority
      t.boolean :active
      t.boolean :complete
      t.string :description
      t.datetime :due_date
      t.string :contact

      t.timestamps
    end
  end
end
