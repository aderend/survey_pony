get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @choice = Choice.new
  @question = Question.new
  erb :'questions/new'
end

get '/takensurveys/:taken_survey_id/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  @choices = @question.choices
  erb :'questions/show'
end

post '/questions' do
  survey = Survey.find_by(id: params[:survey_id])
  @question = survey.questions.build(survey: survey, body: params[:body])
  if @question.save
    if request.xhr?
      erb :'choices/_new_form', layout: false, locals: {question: @question}
    else
      redirect "questions/#{question.id}/choices/new"
    end
  else
    flash[:error] = @question.errors.full_messages
    redirect "surveys/#{survey.id}/questions/new"
  end
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  redirect "/" unless authorized?(@question.survey.creator.id)
  erb :'questions/edit'
end

put '/questions/:id' do
  question = Question.find_by(id: params[:id])
  question.update_attributes(body: params[:body])
  redirect "/questions/#{question.id}/choices/edit"
end

delete '/questions/:id' do
  question = Question.find_by(id: params[:id])
  question.destroy
  next_question = question.survey.next_question(question)
  if next_question.nil?
    redirect "/users/#{current_user.id}"
  else
    redirect "/questions/#{next_question.id}/edit"
  end
end
