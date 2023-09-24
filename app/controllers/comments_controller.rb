# frozen_string_literal: true

class CommentsController < ApplicationController

  private

  def authorize_owner
    return if @comment.user == current_user

    redirect_to @commentable, alert: t('controllers.common.alert_authorize_owner', name: Comment.model_name.human)
  end
end