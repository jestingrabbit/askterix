class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_user

  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_logged_in
    unless @current_user
      flash[:error] = "ಠ_ಠ You need to be logged in to do that ಠ_ಠ"
      redirect_to root_path
    end
  end

  def get_votes
    get_q_vote
    get_a_votes
  end

  def get_q_vote
    @q_vote = QVote.find_by :key => get_key(@current_user.id, @question.id)
  end

  def get_a_votes
    @a_votes = @question.answers.map {|a| get_a_vote a }
  end

  def get_a_vote(answer)
    a_vote = AVote.find_by :key => get_key(@current_user.id, answer.id)
  end

  def get_key (int1, int2)
    id_to_str(int1) << id_to_str(int2)
  end

  def id_to_str(id)
    (id + 2**63).to_s(16).rjust(16, '0')
  end

end
