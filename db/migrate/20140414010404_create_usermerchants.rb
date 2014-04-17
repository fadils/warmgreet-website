class CreateUsermerchants < ActiveRecord::Migration
  def change
    create_table :usermerchants do |t|

      t.timestamps
    end
  end
end
