class SurveysController < ApplicationController
  respond_to :html, :js, :json

  def create
    user_id = session[:user_id]
    title = params[:title]
    @survey = Survey.create(title: title, user_id: user_id)
    questions = params[:questions]
    questions.each_with_index do |question, idx|
      prompt = questions[idx.to_s]["data"]["question"]
      answer1 = questions[idx.to_s]["data"]["answer1"]
      answer2 = questions[idx.to_s]["data"]["answer2"]
      answer3 = questions[idx.to_s]["data"]["answer3"]
      question = Question.create(prompt: prompt, survey_id: @survey.id)
      question.possible_answers.create(content: answer1)
      question.possible_answers.create(content: answer2)
      question.possible_answers.create(content: answer3)
    end
    data_questions = @survey.questions.each do |question|
      {question: question, possible_answers: question.possible_answers }
    end
    render json: @survey.id
  end

  def new
    @survey = Survey.new
    @question = Question.new
    @possible_answer = PossibleAnswer.new
  end

  def show
    @survey = Survey.find(params[:id])
    @submission = @survey.submissions.build
    @letters = ["A","B","C"]
    @questions = @survey.questions.all
    @questions.to_a.map! {|question| {question: question, answers: question.possible_answers }}
    @data = {title: @survey.title, questions: @questions, letters: @letters, survey_id: @survey.id, username: @survey.user.username }
  end

  def owner_display
    @survey = Survey.find(params[:id])
    @questions = @survey.questions.all
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
