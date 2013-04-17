class Project < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  has_many :journals, :dependent => :destroy
  has_many :projects
  belongs_to :user, :foreign_key => "user_id"
  attr_accessible :budget, :common_knowledge, :description, :due_date, :parent, :time, :title, :user_id, :longname, :toplevel
  validates_presence_of :title
  before_save :concatenate_longname

  def concatenate_longname
  	if self.toplevel == false
  		self.title = "#{parent} > #{title}"
  	else
  		self.title = "#{title}"
  	end
  end
end
