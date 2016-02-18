require 'random_data'

class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @questions = Question.new
  end

  def create
    @questions = Question.new(params.require(:question).permit(:title, :body, :resolved))
#    @questions.title = params[:questions][:title]
#    @questions.body = params[:questions][:body]
#    @questions.resolved = params[:questions][:resolved]

    if @questions.save
      flash[:notice] = "Question was saved!"
      redirect_to @questions
    else
      flash.new[:alert] = "Alert. Alert. Error saving question. Try again."
      render :new
    end
  end

  def show
    @questions = Question.find(params[:id])
  end

  def edit
    @questions = Question.find(params[:id])
  end

  def update
    @questions = Question.find(params[:id])
    @questions.title = params[:question][:title]
    @questions.body = params[:question][:body]
    @questions.resolved = params[:question][:resolved]

    if @questions.save
      flash[:notice] = "Question was updated."
      redirect_to @questions
    else
      flash.now[:alert] = "There was an error saving the question. Please try again."
      render :edit
    end
  end

  def destroy
    @questions = Question.find(params[:id])

    if @questions.destroy
      flash[:notice] = "\"#{@questions.title}\" was deleted successfully."
      redirect_to questions_path
    else
      flash.now[:alert] = "Error!"
      render :show
    end
  end
end
