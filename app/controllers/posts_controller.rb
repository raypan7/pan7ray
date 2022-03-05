# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments

    if params[:keyword]
      @comments = @comments.where("comments.content LIKE '%#{params[:keyword]}%'")
    end

    if params[:sort]
      @comments = @comments.order(params[:sort])
    end
  end
end
