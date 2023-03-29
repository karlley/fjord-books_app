# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :set_target_user, only: %i[create destroy]

  def create
    current_user.follow!(@target_user)
    redirect_to user_path(@target_user), notice: t('.notice')
  rescue ActiveRecord::RecordInvalid => e
    logger.error(e.class)
    logger.error(e.message)
    redirect_to user_path(@target_user), alert: t('.alert')
  end

  def destroy
    current_user.unfollow!(@target_user)
    redirect_to user_path(@target_user), notice: t('.notice')
  rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordNotDestroyed => e
    logger.error(e.class)
    logger.error(e.message)
    redirect_to user_path(@target_user), alert: t('.alert')
  end

  private

  def set_target_user
    @target_user = User.find(params[:user_id])
  end
end
