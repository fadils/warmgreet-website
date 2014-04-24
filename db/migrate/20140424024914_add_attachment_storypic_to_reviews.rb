class AddAttachmentStorypicToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :storypic
    end
  end

  def self.down
    drop_attached_file :reviews, :storypic
  end
end
