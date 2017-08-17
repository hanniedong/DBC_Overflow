get '/questions/:question_id/comments/new' do
  @question = question.find(params[:question_id])
  erb :'comments/new'
end

post '/questions/:question_id/comments' do
  @question = question.find(params[:question_id])
  @comment = @question.comments.new(params[:comment])

  if @comment.save
    redirect "/questions/#{@question.id}/comments"
  else
    erb :'comments/new' #show new comments view again(potentially displaying errors)
  end
end
