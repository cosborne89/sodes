class AddDetailsToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :project_id, :integer
    add_column :journals, :user_id, :integer
  end
end
