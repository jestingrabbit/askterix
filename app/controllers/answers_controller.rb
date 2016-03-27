class AnswersController < ApplicationController

  def new #deprecated
    @answer = Answer.new
    @answer.question_id = params[:question_id]
  end

  def create
    @answer = Answer.new answer_params
    @answer.question_id = params[:question_id]
    @answer.score = 1
    @answer.user= @current_user
    if @answer.save
      redirect_to @answer.question
    else
      @question = Question.find params[:question_id]
      render '/questions/show'
    end
  end

  def edit
    @question = Question.find params[:question_id]
    @answer = Answer.find params[:id]
  end

  def answer_params
    params.require(:answer).permit(:text)
  end

end
