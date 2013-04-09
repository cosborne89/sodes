class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :premium, :displayname
  has_many :projects, :dependent => :destroy
  has_many :journals, :dependent => :destroy
  has_many :tasks, :dependent => :destroy

  before_save { |user| user.displayname = user.name.downcase }

  def to_param
  	name.downcase
  end
end
