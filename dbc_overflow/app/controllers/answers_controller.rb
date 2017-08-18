post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(params[:answer])

  if @answer.save
    redirect "/questions/#{@question.id}/answers"
  else
    erb :'answers/new' #show new answers view again(potentially displaying errors)
  end
end

get '/answers/:answer_id/comments/new' do
  @answer = Answer.find(params[:answer_id])
  erb :'comments/new'
end

post '/answers/:answer_id/comments' do
  @answer = Answer.find(params[:answer_id])
  @comment = @answer.comments.new(params[:comment])

  if @comment.save
    redirect "/answers/#{@answer.id}/comments"
  else
    erb :'comments/new' #show new comments view again(potentially displaying errors)
  end
end