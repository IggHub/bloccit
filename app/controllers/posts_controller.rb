class PostsController < ApplicationController
  def index

    @posts = Post.all

    @posts.each_with_index do |post, index| #making every 5 posts "SPAM"
      if (index + 1) % 5 == 0
        post.title = "SPAM"
      else
        post.title
      end
    end

  end

  def show
  end

  def new
  end

  def edit
  end
end
