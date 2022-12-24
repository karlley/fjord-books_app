# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @users = User.find(params[:id]).followings.order(:id).page(params[:page])
  end

  def followers
    @users = User.find(params[:id]).followers.order(:id).page(params[:page])
  end
end
