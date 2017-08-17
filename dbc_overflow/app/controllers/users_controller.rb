# New user
get '/users/new' do
    erb :'users/new'
end

post '/users' do
  @user = User.create(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

# User profile page redirect 
get '/users/:id' do
  # redirect '/sessions/new' unless logged_in?
  @user = User.find(params[:id])
  
  erb :'/users/show'
end