class AddAttachmentPicToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :pic
    end
  end

  def self.down
    drop_attached_file :reviews, :pic
  end
end
