def logged_in?
  !!session[:user_id]
end

def current_user
  User.find_by(id: session[:user_id])
end

def authorized?(page_user_id)
  session[:user_id] == page_user_id.to_i
end
