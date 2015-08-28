get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(username: params[:user])
end