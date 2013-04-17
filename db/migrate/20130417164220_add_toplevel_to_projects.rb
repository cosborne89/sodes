class AddToplevelToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :toplevel, :boolean
  end
end
