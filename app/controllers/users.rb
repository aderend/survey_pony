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
  redirect "/" unless authorized?(params[:id].to_i)
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  redirect "/" unless authorized?(params[:id].to_i)
  @user = User.find_by(id: params[:id])
  erb :'users/edit'
end

put '/users' do
  @user = User.find_by(id: session[:user_id])
  @user.update_attributes(params[:user])
  redirect '/'
end
