class CreateVotecomments < ActiveRecord::Migration
  def change
    create_table :votecomments do |t|
      t.references :comment
      t.references :user
      t.timestamps
    end
  end
end
