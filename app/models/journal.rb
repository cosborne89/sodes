class Journal < ActiveRecord::Base
  attr_accessible :attendees, :begin_time, :body, :end_time, :event_date, :meeting, :title, :user_id
  has_many :tasks
  belongs_to :user, :foreign_key => "user_id"
  accepts_nested_attributes_for :tasks
end
