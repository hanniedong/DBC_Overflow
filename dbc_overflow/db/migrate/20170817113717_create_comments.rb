class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.string :commentable_type
      t.integer :commentable_id
      t.references :user

      t.timestamps
    end
  end
end
