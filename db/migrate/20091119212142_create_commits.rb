class CreateCommits < ActiveRecord::Migration
  def self.up
    create_table :commits do |t|
      t.integer :git_id, :branch_id
      t.string :authored_by
      t.datetime :commited_at
      t.text :message
      t.timestamps
    end
  end

  def self.down
    drop_table :commits
  end
end
