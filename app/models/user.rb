class User < ActiveRecord::Base
	include BCrypt
	has_secure_password

	has_many :created_surveys, class_name: :Survey, foreign_key: :creator_id
	has_many :taken_surveys, foreign_key: :taker_id
	has_many :responses

	validates_presence_of :username, :email, :password
	validates_uniqueness_of :username
end
