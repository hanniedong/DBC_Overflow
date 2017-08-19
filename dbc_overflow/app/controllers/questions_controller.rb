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
  if logged_in?
    @user_vote = @question.votes.find_by(user_id:session[:id])
  end
  upvotes = @question.votes.where(up_vote:1)
  downvotes = @question.votes.where(down_vote:1)
  @total_votes = upvotes.count - downvotes.count
  # p current_user
  # @user = User.find_by(id: session[:user_id])
  # p @answer = @question.answers.find_by(id: @question.id)
  # p @user_of_answer = User.find_by(id: @answer.user_id)
  erb :'/questions/show:vote'
end

post '/questions/:id/upvote' do
  @question = Question.find(params[:id])
  @user_vote = @question.votes.find_by(user_id:session[:user_id])
  if @user_vote != nil
    @user_vote.destroy!
  end
    Vote.create(user_id: session[:user_id], votable_type: "Question", votable_id: @question.id, up_vote: 1)


	redirect "/questions/#{@question.id}"

  # if request.xhr?
  #     @question.votes.to_s
  # else
  #     erb :'/questions/show'
  # end
end

post '/questions/:id/downvote' do
  @question = Question.find(params[:id])
  @user_vote = @question.votes.find_by(user_id:session[:user_id])
  if @user_vote != nil
    @user_vote.destroy!
  end
  Vote.create(user_id: session[:user_id], votable_type: "Question", votable_id: @question.id, down_vote: 1)
  @question.votes.to_s
  redirect "/questions/#{@question.id}"

  # if request.xhr?
  #     @question.votes.to_s
  # else
  #     erb :'/questions/show'
  # end
end