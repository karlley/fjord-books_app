# frozen_string_literal: true

class Books::CommentsController < CommentsController
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

  def destroy
    comment = Comment.find(params[:id])
    if comment.created_by?(current_user)
      comment.destroy
      redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
    else
      redirect_to @commentable, alert: t('controllers.common.alert_authorize_owner', name: Comment.model_name.human)
    end
  end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def comments_params
    params.require(:comment).permit(:content)
  end
end
