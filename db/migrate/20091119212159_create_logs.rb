class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.string :name
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end
end
