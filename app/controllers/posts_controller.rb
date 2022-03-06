# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show update edit destroy]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments

    if params[:keyword]
      @comments = @comments.where("comments.content LIKE '%#{params[:keyword]}%'")
    end

    if params[:sort]
      @comments = @comments.order(params[:sort])
    end
  end

  def new
    @post = Post.new
  end

  def create
    ActiveRecord::Base.transaction do
      p_params = post_params.dup
      @post = Post.new(p_params)
      @post.save!
      flash[:notice] = 'Created Successfully!'
      redirect_to(posts_path)
    rescue StandardError => e
      flash[:alert] = "Create Failed，#{e}"
      redirect_to(posts_path)
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
