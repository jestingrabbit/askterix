class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find params[:id]
    @answer = Answer.new
    @answer.question_id = params[:id]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    @question.score = 1
    @question.user = @current_user
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end


  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.update params[:id], question_params
    @question.edited_at = question.updated_at
    if @question.save
      redirect_to question
    else
      render :edit
    end
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
