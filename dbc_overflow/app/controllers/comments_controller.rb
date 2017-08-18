get '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comments = Comment.where(commentable_id: params[:question_id])

  if @comments
    erb :'questions/comments/show'
  else
    redirect :'questions/comments/new'
  end

end

post '/questions/:question_id/comments' do
  @question = question.find(params[:question_id])
  @comment = @question.comments.new(params[:comment])

  if @comment.save
    redirect "/questions/#{@question.id}/comments"
  else
    erb :'questions/comments/new' #show new comments view again(potentially displaying errors)
  end
end
