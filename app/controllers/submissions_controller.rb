class SubmissionsController < ApplicationController
  respond_to :js, :json, :html

  def create
    ids = params[:answerIDs]
    survey_id = params[:surveyId]
    ids.each do |id|
      possible_answer = PossibleAnswer.find(id)
      count = possible_answer.count + 1
      possible_answer.update_attributes(count: count)
    end
    @survey = Survey.find(params[:surveyId])
    @submission = @survey.submissions.create()
    render json: @submission.id.to_json
  end

  def show
    @submission = Submission.find(params[:id])
  end
end
