class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :text
      t.integer :score
      t.datetime :edited_at
      t.timestamps null: false
    end
    add_index :answers, :question_id
  end
end
