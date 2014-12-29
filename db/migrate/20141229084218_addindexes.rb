class Addindexes < ActiveRecord::Migration
  add_index :notifications, :user_id, unique: true
  add_index :messages, :user_id, unique: true
  add_index :messages, :topic_id, unique: true
end
