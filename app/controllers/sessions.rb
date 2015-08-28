get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
  if @user
    redirect '/'
  else
    #add flash error
    redirect '/fail'
  end
end

delete '/logout' do
  session.clear
  redirect '/logged_out'
end