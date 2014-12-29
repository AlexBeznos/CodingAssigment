class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  has_and_belongs_to_many :topics
  has_many :notifications, class_name: "Message", foreign_key: "user_id"
end
