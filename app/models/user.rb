class User < ApplicationRecord
	before_create :create_remember_token, :remember_digest
	attr_accessor :remember_token
	has_secure_password
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 50}
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
	validates :password, presence: true, length: {minimum:6}, allow_nil: true
	validates_inclusion_of :member, in: [true, false]
	before_save :downcase_email


	def User.digest(string)
		cost= ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
													 BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token= User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(token)
	end




private

	def downcase_email
		self.email.downcase!
	end

	def create_remember_token
		self.remember_token= User.new_token
		self.remember_digest=User.digest(remember_token)
	end




end
