class Questions::AnswersController < ApplicationController

  before_filter :answer_ownership, :except => :create
  before_filter :check_logged_in, :only => :create
  after_action :get_q_vote, :except => [:destroy]

  def create
    @answer = Answer.new answer_params
    @question = Question.find params[:question_id]
    @answer.question = @question
    @answer.score = 1
    @answer.user= @current_user
    if @answer.save
      redirect_to @question
    else
      before_render
      render '/questions/show'
    end
  end

  def edit # @question and @answer are loaded by the before filter.
    before_render
    render '/questions/show'
  end

  def update
    @answer.update answer_params
    unless @answer.errors.any?
      @answer.edited_at = @answer.updated_at
      @answer.save
      before_render
      redirect_to @question
    else
      before_render
      render '/questions/show'
    end
  end

  def destroy
    @answer.destroy
    # Yeah, trying to learn ajax in one night when the ruby docs are in coffeescript, non trivial.
    # respond_to do |format|
    #   format.html { redirect_to question_path }
    #   format.json { head :no_content }
    # end
    redirect_to @question
  end

  private
  def answer_params
    params.require(:answer).permit(:text)
  end

  def answer_ownership
    @question = Question.find params[:question_id]
    @answer =@question.answers.find params[:id]
    unless @answer.user == @current_user
      flash[:error] = "ಠ_ಠ don't edit what isn't yours ಠ_ಠ"
      redirect_to root_path
    end
  end

  def before_render #if anyone can explain to me why this isn't in rails, you can go fuck yourself.
    # and yes, I know about the gem, thankyou. I'm doing this at fucking 2am on friday and don't
    # want a deploy issue.
    @answers = @question.answers
    get_votes
  end
end
