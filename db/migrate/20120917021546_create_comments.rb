class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.references :user
      t.references :post
      t.timestamps
    end
  end
end
