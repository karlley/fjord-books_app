class Users::FollowersController < ApplicationController
  def index
    @followers = User.find(params[:user_id]).followers.order(:id).page(params[:page])
  end
end
