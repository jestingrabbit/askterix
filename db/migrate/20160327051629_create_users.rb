class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :password_digest
      t.text :name
      t.text :email
      t.text :avatar
      t.text :link
      t.text :bio
      t.integer :points
      t.integer :hide_state
      t.integer :admin
      t.timestamps
    end
  end
end
