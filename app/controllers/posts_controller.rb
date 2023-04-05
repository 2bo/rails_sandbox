# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @pots = Post.all.order(id: :desc)
    Comment.create(content: 'content', post: @posts.first)
    pp 'hoge'
    @comments = Comment.all
    render json: @pots
  end
end
