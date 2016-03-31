class CreateQVotes < ActiveRecord::Migration
  def change
    create_table :q_votes, :id => false do |t|
      t.string :key, :null => false
      t.integer :user_id
      t.integer :question_id
      t.integer :valency
      t.timestamps
    end
    add_index :q_votes, :key, :unique => true
  end
end
