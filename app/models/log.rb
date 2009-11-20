class Log < ActiveRecord::Base

  include Grit
  has_many :commits, :class_name => "::Commit"
  
  has_attached_file :attachment, 
                    :path => ":rails_root/public/gits/:basename.:extension",
                    :url => "/gits/:basename.:extension"

  validates_attachment_presence :attachment
  
  #after_save :unzip
  
  def hashed_id
    Digest::SHA1.hexdigest(self.id)
  end
  
  def unzip
    FileUtils.mkdir_p("#{RAILS_ROOT}/tmp/#{id}")
    `tar -xf #{RAILS_ROOT}/public/gits/#{attachment_file_name} -C #{RAILS_ROOT}/tmp/#{id}`
  end
  
  def read_git
    unzip
    repo = Repo.new("#{RAILS_ROOT}/tmp/#{id}/")
    
    repo.commits.each do |commit|
      commits.create!(:message => commit.message, :authored_by => commit.author.to_s, :commited_at => commit.date)
    end  
  end
  
end
