class AVotesController < ApplicationController
  before_action do
    check_logged_in
    if @current_user
      get_question_and_answer
      @a_vote = get_a_vote @answer
    end
  end
  # get ready for some sub optimal code.
  #That's been copy and pasted and modded from q_votes_controller.

  def up
    if @a_vote.nil?
      AVote.create({
        :key => get_key(@current_user.id, @answer.id),
        :user_id => @current_user.id,
        :answer_id => @answer.id,
        :valency => 1
      })
      @answer.score += 1
      @answer.save
      redirect_to @question
    elsif @a_vote.valency == -1
      @a_vote.valency = 1
      @a_vote.save
      @answer.score += 2
      @answer.save
      redirect_to @question
    else
      @a_vote.destroy
      @answer.score -=1
      @answer.save
      redirect_to @question
    end
  end

  def down
    if @a_vote.nil?
      AVote.create({
        :key => get_key(@current_user.id, @answer.id),
        :user_id => @current_user.id,
        :answer_id => @answer.id,
        :valency => -1
      })
      @answer.score -= 1
      @answer.save
      redirect_to @question
    elsif @a_vote.valency == 1
      @a_vote.valency = -1
      @a_vote.save
      @answer.score -= 2
      @answer.save
      redirect_to @question
    else
      @a_vote.destroy
      @answer.score +=1
      @answer.save
      redirect_to @question
    end
  end

  private
  def get_question_and_answer
    @question = Question.find params[:question_id]
    @answer = Answer.find params[:answer_id]
  end
end
