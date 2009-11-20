class Commit < ActiveRecord::Base

  belongs_to :log
  
  validates_presence_of :authored_by
  validates_presence_of :commited_at
  validates_presence_of :message
  
end
