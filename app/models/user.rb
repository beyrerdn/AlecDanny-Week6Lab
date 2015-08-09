class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :posts
  has_many :followers
  has_one :profile
  accepts_nested_attributes_for :profile
  acts_as_follower
  acts_as_followable

end
