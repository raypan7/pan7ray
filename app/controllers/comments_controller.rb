# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  before_action :require_admin!, only: [:highlight]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user

    if @comment.save
      flash[:notice] = '留言成功！'
      redirect_to(post_path(@post))
    else
      render('posts/show')
    end
  end

  def highlight
    @comment = @post.comments.find(params[:id])
    @comment.highlight_at = Time.current
    @comment.save!

    redirect_to(post_path(@post))
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.can_deleted_by(current_user)
      flash[:notice] = '成功刪除留言!'
      @comment.destroy
    end

    redirect_to(post_path(@post))
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
