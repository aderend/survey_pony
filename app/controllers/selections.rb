post '/selections' do
  taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  choice = Choice.find_by(id: params[:choice_id])
  selection = Selection.new(taken_survey: taken_survey, user: current_user, choice: choice)
  survey = taken_survey.survey
  next_question = survey.next_question(choice.question)

  if selection.save
    taken_summary = taken_survey.taken_summary
    if request.xhr?
      if next_question.nil?
        erb :"/taken_surveys/_show_answers", layout: false, locals: {
          survey: survey,
          taken_summary: taken_summary
          }
      else
        erb :"/questions/_draw_question", layout: false, locals: {
          taken_survey: taken_survey,
          question: next_question
        }
      end
    else
      redirect "/takensurveys/#{taken_survey.id}" if next_question.nil?
      redirect "/takensurveys/#{taken_survey.id}/questions/#{next_question.id}"
    end
  else
    flash[:error] = selection.errors.full_messages
    redirect "/takensurveys/#{taken_survey.id}/questions/#{params[:question_id]}"
  end
end