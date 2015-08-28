get '/signup' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  # binding.pry
  if @user.save
    redirect to'/'
  else
    #add flash error
    redirect '/fail'
  end
end