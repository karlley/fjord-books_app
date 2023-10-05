# frozen_string_literal: true

class CommentsController < ApplicationController
  private

  def comment_author?(comment)
    comment.user == current_user
  end
end
