class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.datetime :time
      t.string :title
      t.text :description
      t.text :common_knowledge
      t.integer :parent
      t.date :due_date
      t.decimal :budget

      t.timestamps
    end
  end
end
