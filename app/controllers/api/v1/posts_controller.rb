# frozen_string_literal: true

class Api::V1::PostsController < ApplicationController
  before_action :load_user, only: %i[create index]

  def create
    @post = @user.posts.create! post_params
  end

  def index
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!

    head :ok
  end

  private

  def post_params
    params.permit(:title, :content)
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end
