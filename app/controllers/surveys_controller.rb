class SurveysController < ApplicationController
  respond_to :html, :js, :json
  def create
    p params
    user_id = 2
    title = params[:title]
    @survey = Survey.create(title: title, user_id: user_id)
    questions = params[:questions]
    questions.each do |question|
      prompt = questions.first[1]["data"]["question"]
      answer1 = questions.first[1]["data"]["answer1"]
      answer2 = questions.first[1]["data"]["answer2"]
      answer3 = questions.first[1]["data"]["answer3"]
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
    @letters = ["A","B","C"]
    @questions = @survey.questions.all
  end

  def owner_display
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
