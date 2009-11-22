class CreateGits < ActiveRecord::Migration
  def self.up
    create_table :gits do |t|
      t.string :name
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at
      t.string :permalink
      t.timestamps
    end
  end

  def self.down
    drop_table :gits
  end
end
