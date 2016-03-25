class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :title
      t.text :text
      t.integer :score
      t.datetime :edited_at
      t.timestamps null: false
    end
  end
end
