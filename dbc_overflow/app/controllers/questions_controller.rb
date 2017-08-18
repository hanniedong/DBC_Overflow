get '/questions' do
	@questions = Question.all
  # binding.pry
	erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  Question.create!(params[:question])
  redirect '/'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @user = User.find_by(id: session[:user_id])
  @answer = @question.answers.find_by(id: @question.id)
  @user_of_answer = User.find_by(id: @answer.user_id)
  erb :'/questions/show'
end

post '/questions/:id/upvote' do
  @question = Question.find(params[:id])
  @question.votes.create
  @question.votes.to_s
	erb :'/questions/show'

  # if request.xhr?
  #     @question.votes.to_s
  # else
  #     erb :'/questions/show'
  # end
end