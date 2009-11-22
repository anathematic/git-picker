class Commit < ActiveRecord::Base

  xss_terminate

  belongs_to :log
  belongs_to :git
  
  validates_presence_of :authored_by
  validates_presence_of :commited_at
  
  cattr_reader :per_page
  @@per_page = 10
  
  has_permalink :name, :update => true
  
  def to_param
    id.to_s + "-" + self.permalink
  end
  
  def before_save
    self.message = "No message found for this commit"
  end
  
end
