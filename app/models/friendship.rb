# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :follow_source, class_name: 'User'
  belongs_to :follow_target, class_name: 'User'
  validates :follow_source_id, presence: true
  validates :follow_target_id, presence: true
end
