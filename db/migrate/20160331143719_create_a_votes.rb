class CreateAVotes < ActiveRecord::Migration
  def change
    create_table :a_votes, :id => false do |t|
      t.string :key, :null => false
      t.integer :user_id
      t.integer :answer_id
      t.integer :valency
      t.timestamps
    end
    add_index :a_votes, :key, :unique => true
  end
end
