# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Post created!' }
        format.turbo_stream { redirect_to posts_path, status: :see_other }
      end
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.present?
      @post_id = @post.id

      # @post.destroy

      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Post deleted!' }
        # format.turbo_stream { render turbo_stream: turbo_stream.remove(@post) }
        format.turbo_stream # destroy.turbo_stream.erb
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end