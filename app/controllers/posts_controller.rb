class PostsController < ApplicationController
  def index

    @posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new
    @posts = Post.new
  end

  def edit
  end

  def create
    @posts = Post.new
    @posts.title = params[:post][:title]
    @posts.body = params[:post][:body]

    if @posts.save
      flash[:notice] = "Post was saved!"
      redirect_to @posts
    else
      flash.new[:alert] = "Alert. Alert. Error saving post. Try again."
      render :new
    end

  end
end
