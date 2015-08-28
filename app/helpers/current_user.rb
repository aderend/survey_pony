def current_user
  user = User.find_by(id: session[:user_id])
  return user
end