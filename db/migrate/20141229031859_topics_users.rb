class TopicsUsers < ActiveRecord::Migration
  def change
    create_table :topics_users do |t|
      t.integer :user_id
      t.integer :topic_id
    end
  end
end
