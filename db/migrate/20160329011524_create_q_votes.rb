class CreateQVotes < ActiveRecord::Migration
  def change
    create_table :q_votes do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :valency
      t.timestamps
    end
  end
end
