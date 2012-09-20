# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

module ExampleMixin

  def self.included(obj)
    puts "This would be always called on obj: #{obj.inspect}"
  end
  def try_it(user)
    puts "called before_save #{user.email}"
  end

  def method_missing(arg1, arg2)
    puts "this gets called if some one invokes a non existent
          method on ExampleMixin."
  end
end

class User < ActiveRecord::Base
  has_secure_password
  include ExampleMixin
  attr_accessible :email, :name, :password, :password_confirmation

  #before_save { |user| try_it user }
  before_save { |user| user.email = user.email.downcase}

  validates :name,  presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format:{with: VALID_EMAIL_REGEX},
             uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence:true
end
