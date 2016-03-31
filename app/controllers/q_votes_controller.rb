class QVotesController < ApplicationController
  before_action do
    check_logged_in
    get_question
    get_q_vote
  end
  # get ready for some sub optimal code.

  def up
    if @q_vote.nil?
      QVote.create({
        :key => get_key(@current_user.id, @question.id),
        :user_id => @current_user.id,
        :question_id => @question.id,
        :valency => 1
      })
      @question.score += 1
      @question.save
      redirect_to @question
    elsif @q_vote.valency == -1
      @q_vote.valency = 1
      @q_vote.save
      @question.score += 2
      @question.save
      redirect_to @question
    else
      @q_vote.destroy
      @question.score -=1
      @question.save
      redirect_to @question
    end
  end

  def down
    if @q_vote.nil?
      QVote.create({
        :key => get_key(@current_user.id, @question.id),
        :user_id => @current_user.id,
        :question_id => @question.id,
        :valency => -1
      })
      @question.score -= 1
      @question.save
      redirect_to @question
    elsif @q_vote.valency == 1
      @q_vote.valency = -1
      @q_vote.save
      @question.score -= 2
      @question.save
      redirect_to @question
    else
      @q_vote.destroy
      @question.score +=1
      @question.save
      redirect_to @question
    end
  end

  private
  def get_question
    @question = Question.find params[:question_id]
  end
end
