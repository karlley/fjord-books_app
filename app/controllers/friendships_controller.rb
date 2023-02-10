# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :set_target_user, only: %i[create destroy]

  def create
    if current_user.follow(@target_user)
      redirect_to user_path(@target_user), notice: t('.notice')
    else
      redirect_to user_path(@target_user), alert: t('.alert')
    end
  end

  def destroy
    if current_user.unfollow(@target_user)
      redirect_to user_path(@target_user), notice: t('.notice')
    else
      redirect_to user_path(@target_user), alert: t('.alert')
    end
  end

  private

  def set_target_user
    @target_user = User.find(params[:user_id])
  end
end
