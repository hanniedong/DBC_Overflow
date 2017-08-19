class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :user
      t.integer :down_vote, default: 0
      t.integer :up_vote, default: 0
      t.string :votable_type
      t.integer :votable_id

      t.timestamps
    end
  end
end
