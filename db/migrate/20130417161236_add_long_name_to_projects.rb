class AddLongNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :longname, :string
  end
end
