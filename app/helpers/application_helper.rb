# frozen_string_literal: true

module ApplicationHelper
  def comment_user?(comment)
    comment.user == current_user
  end
end
