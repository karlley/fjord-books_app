# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to @commentable
    end
  end

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def comments_params
    params.require(:comment).permit(:content)
  end
end
