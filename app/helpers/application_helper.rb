module ApplicationHelper
  def total_questions
    @questions = 0
    @user.surveys.collect {|s| @questions += s.questions.count}
    return @questions
  end

  def total_submissions
    @submissions = 0
    @user.surveys.collect {|s| @submissions += s.submissions.count}
    return @submissions
  end

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
