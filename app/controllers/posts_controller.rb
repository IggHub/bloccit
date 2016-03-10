require 'random_data'

class PostsController < ApplicationController

  before_action :require_sign_in, except: :show
#any other action REQUIRES user to sign in, except show. Anyone, even un-signed user can view the posts!
  before_action :authorize_to_destroy, only: [:destroy]
  before_action :authorize_to_edit_update, only: [:edit, :update]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.save
      flash[:notice] = "Post was updated."
#      redirect_to @post
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def create

    @topic = Topic.find(params[:topic_id])
    @post =  @topic.posts.build(post_params)

    @post.user = current_user

    if @post.save
      flash[:notice] = "Post was saved!"
      redirect_to [@topic,@post]
    else
      flash.now[:alert] = "Alert. Alert. Error saving post. Try again."
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
#      redirect_to post_path
      redirect_to @post.topic
    else
      flash.now[:alert] = "Error!"
      render :show
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_to_destroy
    post = Post.find(params[:id])

    unless current_user == post.user || current_user.admin?
      flash[:alert] = "You must be an admin to do that"
      redirect_to [post.topic, post]
    end
  end

  def authorize_to_edit_update
    post = Post.find(params[:id])


    unless current_user == post.user || current_user.admin? || current_user.moderator?
      flash[:alert] = "Need to be admin/moderator/ owner to do that"
      redirect_to [post.topic, post]
    end
  end
end
