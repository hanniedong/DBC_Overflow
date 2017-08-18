get '/questions' do
	@questions = Question.all
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