require 'random_data'

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
    @posts = Post.find(params[:id])
  end

  def update
    @posts = Post.find(params[:id])
    @posts.title = params[:post][:title]
    @posts.body = params[:post][:body]

    if @posts.save
      flash[:notice] = "Post was updated."
      redirect_to @posts
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
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

  def destroy
    @posts = Post.find(params[:id])

    if @posts.destroy
      flash[:notice] = "\"#{@posts.title}\" was deleted successfully."
      redirect_to posts_path
    else
      flash.now[:alert] = "Error!"
      render :show
    end
  end
  
end
