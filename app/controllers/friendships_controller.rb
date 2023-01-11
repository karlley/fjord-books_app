# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    target_user = User.find(params[:user_id])
    if current_user.follow(target_user.id)
      redirect_to user_path(target_user), notice: t('.notice')
    else
      flash.now[:alert] = t('.alert')
      render 'users/show'
    end
  end

  def destroy
    target_user = User.find(params[:user_id])
    if current_user.unfollow(target_user.id)
      redirect_to user_path(target_user), notice: t('.notice')
    else
      flash.now[:alert] = t('.alert')
      render 'users/show'
    end
  end
end
