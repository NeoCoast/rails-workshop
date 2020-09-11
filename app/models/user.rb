# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  has_many :follower_follows, foreign_key: 'followee_id', class_name: 'Follow'
  has_many :followers, through: :follower_follows, source: :follower

  has_many :followee_follows, foreign_key: 'follower_id', class_name: 'Follow'
  has_many :followees, through: :followee_follows, source: :followee

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def follow(user_id)
    followee = User.find(user_id)
    followees.push(followee)
  end
end
