get '/signup' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    flash[:notice] = "Successful sign up!"
    redirect '/'
  else
    flash[:error] = user.errors.full_messages
    redirect '/signup'
  end
end

get '/users/:id' do
  redirect "/" unless authorized?(params[:id])
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  redirect "/" unless authorized?(params[:id])
  @user = User.find_by(id: params[:id])
  erb :'users/edit'
end

put '/users' do
  current_user.update_attributes(params[:user])
  redirect '/'
end
