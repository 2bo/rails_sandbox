# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc)
    render json: @posts
  end
end
