class Addindexes < ActiveRecord::Migration
  add_index :notifications, :user_id
  add_index :messages, :user_id
  add_index :messages, :topic_id
end
