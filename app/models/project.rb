class Project < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  has_many :journals, :dependent => :destroy
  belongs_to :projects
  belongs_to :user, :foreign_key => "user_id"
  attr_accessible :budget, :common_knowledge, :description, :due_date, :parent, :time, :title, :user_id
  before_save { validates_presence_of :title }
end
