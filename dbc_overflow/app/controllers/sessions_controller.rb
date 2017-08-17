get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
 @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 422
    @errors = ["Invalid Email/Password Combination!"]
    erb :"sessions/new"
  end
end

delete '/logout' do 
  logout
  redirect '/'
end
