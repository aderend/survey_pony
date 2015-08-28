get '/signup' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect to'/'
  else
    #add flash error
    redirect '/fail'
  end
end

get '/users/edit' do
  @user = User.find_by(id: session[:user_id])
  erb :'/users/edit'
end

put '/users' do
  @user = User.find_by(id: session[:user_id])
  @user.update_attributes(params[:user])
  redirect '/'

end