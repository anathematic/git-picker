class Git < ActiveRecord::Base

  include Grit
  has_many :commits, :class_name => "::Commit"
  
  has_attached_file :attachment, 
                    :path => ":rails_root/public/gits/:basename.:extension",
                    :url => "/gits/:basename.:extension"

  validates_attachment_presence :attachment, :message => "You must add a file to upload"
  
  after_save :load_commits
  
  def hashed_id
    Digest::SHA1.hexdigest(self.id)
  end
  
  def unzip
    FileUtils.mkdir_p("#{RAILS_ROOT}/tmp/#{id}")
    `tar -xf #{RAILS_ROOT}/public/gits/#{attachment_file_name} -C #{RAILS_ROOT}/tmp/#{id}`
  end
  
  def git_repo
    unzip
    @git_repo ||= Repo.new("#{RAILS_ROOT}/tmp/#{id}/")
  end
  
  def read_branches
    git_repo.branches.each do |branch|
      branches.create!(:name => branch.name)
    end
  end
  
  def load_commits
    git_repo.commits('master', 9999).each do |commit|
      commits.create!(:message => commit.message, :authored_by => commit.author.to_s, :commited_at => commit.date)
    end  
  end
  
  
end
