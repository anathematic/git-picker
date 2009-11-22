class Commit < ActiveRecord::Base

  belongs_to :log
  belongs_to :git
  
  validates_presence_of :authored_by
  validates_presence_of :commited_at
  validates_presence_of :message
  
  cattr_reader :per_page
  @@per_page = 10
  
end
