# frozen_string_literal: true

class Api::V1::CommentsController < ApplicationController
  before_action :load_post

  def create
    @comment = @post.comments.create! comment_params
  end

  private

  def comment_params
    params.permit(:content)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
