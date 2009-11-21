class Branch < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :git_id
  
end
