class QuestionsController < ApplicationController

  before_filter :question_ownership, :only => [:edit, :update, :destroy]
  before_filter :check_logged_in, :only => [:new, :create]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find params[:id]
    @answer = Answer.new
    @answers = @question.answers
    get_votes
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
  end

  def update
    @question.update question_params
    unless @question.errors.any?
      @question.edited_at = @question.updated_at
      @question.save
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions
  end

  private
  def question_params
    params.require(:question).permit(:id, :title, :text)
  end

  def question_ownership
    @question = Question.find params[:id]
    unless @question.user == @current_user
      flash[:error] = "ಠ_ಠ don't edit what isn't yours ಠ_ಠ"
      redirect_to root_path
    end
  end

end
