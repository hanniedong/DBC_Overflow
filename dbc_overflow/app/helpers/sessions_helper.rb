def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def logged_in?
	!!current_user
end

def logout
	session[:user_id] = nil
end

def login(user)
	@user.authenticate(params[:user][:email], params[:user][:password])
	session[:user_id] = @user.id
end