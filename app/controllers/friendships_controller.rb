# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :set_target_user, only: %i[create destroy]
  rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound, ActiveRecord::RecordNotDestroyed, with: :display_follow_unfollow_errer

  def create
    current_user.follow!(@target_user)
    redirect_user_page
  end

  def destroy
    current_user.unfollow!(@target_user)
    redirect_user_page
  end

  private

  def set_target_user
    @target_user = User.find(params[:user_id])
  end

  def redirect_user_page
    redirect_to user_path(@target_user), notice: t('.notice')
  end

  def display_follow_unfollow_errer
    redirect_to user_path(@target_user), alert: t('.alert')
  end
end
