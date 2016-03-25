class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find params[:id]
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.create question_params
    question.score = 0
    redirect_to question
  end


  def edit
    @question = Question.find params[:id]
  end

  def update
    question = Question.update params[:id], question_params
    question.edited_at = question.updated_at
    question.save #feels kinda ugly, but it works
    redirect_to question
  end

  def destroy
    Question.destroy params[:id]
    redirect_to questions
  end

  private
  def question_params
    params.require(:question).permit(:id, :title, :text)
  end

end
