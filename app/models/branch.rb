class Branch < ActiveRecord::Base
  
  xss_terminate
  
  belongs_to :git
  has_many :commits, :class_name => "::Commit"
  
  validates_presence_of :name
  validates_presence_of :git_id
  
  attr_accessor :repo_commits
  after_save :load_commits
 
  cattr_reader :per_page
  @@per_page = 10
  
  has_permalink :name, :update => true
  
  def to_param
    id.to_s + "-" + self.permalink
  end
   
  def load_commits
    repo_commits.each do |commit|
      commits.create!(:message => commit.message, :authored_by => commit.author.to_s, :commited_at => commit.date)
    end
  end
  
end
