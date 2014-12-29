class TopicsUsers < ActiveRecord::Migration
  def change
    create_table :topics_users do |t|
      t.integer :user_id
      t.integer :topic_id
    end
    add_index :topics_users, :user_id
    add_index :topics_users, :topic_id
  end
end
