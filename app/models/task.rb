class Task < ActiveRecord::Base
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :tasks
  belongs_to :journals, :foreign_key => "journal_id"
  belongs_to :projects, :foreign_key => "project_id"
  attr_accessible :active, :complete, :contact, :description, :due_date, :priority, :user_id, :journal_id, :project_id 

before_save :default_values
def default_values
	#set default values here. THis is just an example.
end

end
