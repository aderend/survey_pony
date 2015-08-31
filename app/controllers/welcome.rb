get '/' do
  erb :'home'
end

get '/login' do
  erb :'users/login'
end

