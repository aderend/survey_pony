def self.logged_in?(user_id)
  return true if session[:user_id] == user_id
end