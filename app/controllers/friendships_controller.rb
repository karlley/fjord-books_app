# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    follow_target = User.find(params[:user_id])
    if current_user.follow(follow_target)
      redirect_to user_path(follow_target), notice: t('.notice_create')
    else
      flash.now[:alert] = t('.alert_create')
      render 'users/show'
    end
  end

  def destroy
    unfollow_target = User.find(params[:user_id])
    if current_user.unfollow(unfollow_target)
      redirect_to user_path(unfollow_target), notice: t('.notice_destroy')
    else
      flash.now[:alert] = t('.alert_destroy')
      render 'users/show'
    end
  end
end
