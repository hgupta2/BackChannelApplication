class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :fname
      t.string :lname
      t.string :dob
      t.string :email
      t.string :salt
      t.string :encrypted_password
      t.boolean :admin

      t.timestamps
    end
  end
end
