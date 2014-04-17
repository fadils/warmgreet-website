class CreateUsercategories < ActiveRecord::Migration
  def change
    create_table :usercategories do |t|

      t.timestamps
    end
  end
end
