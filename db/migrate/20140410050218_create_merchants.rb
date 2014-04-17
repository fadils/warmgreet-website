class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name, null: false
      t.string :website
      t.integer :price
      t.integer :phone
      t.string :street, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.integer :zip
      t.boolean :open, default: true
      t.timestamps
    end
  end
end
