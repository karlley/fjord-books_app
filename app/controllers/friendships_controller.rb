# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    follow_target = User.find(params[:user_id])
    current_user.follow(follow_target)
    redirect_to user_path(follow_target), notice: t('.notice_create')
  end

  def destroy
    unfollow_target = User.find(params[:user_id])
    current_user.unfollow(unfollow_target)
    redirect_to user_path(unfollow_target), notice: t('.notice_destroy')
  end
end
