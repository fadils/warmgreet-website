class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.integer :state_id, null: false
      t.timestamps
    end

    add_index :countries, :state_id
  end
end
