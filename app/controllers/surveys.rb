get "/surveys" do
  @surveys = Survey.limit(25).order(updated_at: :desc)
  erb :"/surveys/index"
end

get "/surveys/new" do
  @survey = Survey.new
  erb :"/surveys/new"
end

get "/surveys/:id" do
  @survey = Survey.find_by(id: params[:id])
  erb :"/surveys/show"
end

post "/surveys" do
  survey = current_user.created_surveys.create(params[:survey])
  redirect "/surveys/#{survey.id}/questions/new"
end

get "/surveys/:id/edit" do
  @survey = Survey.find_by(id: params[:id])
  if @survey.created_by?(current_user)
  	erb :'surveys/edit'
	else
  	flash[:error] = "You cannot edit this survey!"
    redirect '/surveys'
	end
end

put "/surveys/:id" do
	survey = Survey.find_by(id: params[:id])
	survey.update_attributes(params[:survey])
	redirect "/questions/#{survey.questions.first.id}/edit"
end

delete "/surveys/:id" do
  survey = Survey.find_by(id: params[:id])
  survey.destroy
  redirect "/users/#{current_user.id}"
end
