# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: :desc)
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    @post.comments.each do
      Rails.logger.info "comment: #{comment.inspect}"
    end
    render json: @post
  end
end
