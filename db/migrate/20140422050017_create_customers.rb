class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
	  t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email, null: false
      t.integer :merchant_number, null:false
      t.text :biography
      t.integer :age
      t.string :gender
      t.string :ethnicity
      t.string :location
      t.boolean :admin, default: false
      t.string :session_token, null: false
      t.timestamps
    end

    add_index :customers, :username, unique: true
    add_index :customers, :email, unique: true
  end
end
