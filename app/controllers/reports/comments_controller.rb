# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: :destroy
  before_action :authorize_owner, only: :destroy

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

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:content)
  end
end
