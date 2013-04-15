class Journal < ActiveRecord::Base
  attr_accessible :attendees, :begin_time, :body, :end_time, :event_date, :meeting, :title, :user_id, :project_id, :task_id
  has_many :tasks
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :project, :foreign_key => "project_id"
  accepts_nested_attributes_for :tasks

  before_save { validates_presence_of :project_id }

  def new_record?
	false
  end
end
