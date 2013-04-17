class ChangeParentToString < ActiveRecord::Migration
  def up
  	change_column :projects, :parent, :string
  end

  def down
  	change_column :projects, :parent, :number
  end
end
