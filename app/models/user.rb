# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_friendships, class_name: 'Friendship', foreign_key: 'follow_source_id', dependent: :destroy, inverse_of: :follow_source
  has_many :passive_friendships, class_name: 'Friendship', foreign_key: 'follow_target_id', dependent: :destroy, inverse_of: :follow_target
  has_many :followings, through: :active_friendships, source: :follow_target
  has_many :followers, through: :passive_friendships, source: :follow_source
end
