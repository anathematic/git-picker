class Git < ActiveRecord::Base

  include Grit
  xss_terminate

  has_many :commits, :class_name => "::Commit", :through => :branches
  has_many :branches, :class_name => "::Branch"
  
  has_attached_file :attachment, 
                    :path => ":rails_root/public/gits/:basename.:extension",
                    :url => "/gits/:basename.:extension"

  validates_attachment_presence :attachment, :message => "You must add a file to upload"
  # validates_attachment_content_type :attachment, :content_type => ["application/x-compressed", "application/x-gzip", "application/x-tar-gz"], :message => "Tar files only please"
  
  before_save :assign_name
  after_save :load_branches
  
  def assign_name
    self.name = "Git Repo" unless name
  end
  
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
  
  def load_branches
    git_repo.branches.each do |branch|
      branch_commits = git_repo.commits(branch.name, 800)
      branch_commits ||= []
      branches.create!(:name => branch.name, :repo_commits => branch_commits)
    end
  end
  
end
