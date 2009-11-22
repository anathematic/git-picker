class Branch < ActiveRecord::Base
  
  belongs_to :git
  has_many :commits, :class_name => "::Commit"
  
  validates_presence_of :name
  validates_presence_of :git_id
#  validates_presence_of :repo_commits
  
  attr_accessor :repo_commits
  after_save :load_commits
  
  def load_commits
    repo_commits.each do |commit|
      commits.create!(:message => commit.message, :authored_by => commit.author.to_s, :commited_at => commit.date)
    end
  end
  
end
