require 'faker'



  user1 = User.create(username: Faker::Name.name, email: Faker::Internet.email, password_hash: 'password')
  user2 = User.create(username: Faker::Name.name, email: Faker::Internet.email, password_hash: 'password')

  # user asks question
  user1.questions.create(title: "#{user1.username} Question Title", body: "#{user1.username} Question Body")
  user2.questions.create(title: "#{user2.username} Question Title", body: "#{user2.username} Question Body")
  # second user answers that question
  user2.answers.create(body: "#{user2.username} Answer Body", question: Question.first)
  user1.answers.create(body: "#{user1.username} Answer Body", question: Question.last)


users = User.all
questions = Question.all
answers = Answer.all

# create comments for Q & As
questions.each do |question|
  # 3 comments from random users
  question.comments.create(user: users.sample, content: Faker::Pokemon.name)
  question.comments.create(user: users.sample, content: Faker::Pokemon.name)
  question.comments.create(user: users.sample, content: Faker::Pokemon.name)

  # 3 votes from random users
  question.votes.create(user: users.sample)
  question.votes.create(user: users.sample)
  question.votes.create(user: users.sample)
end

answers.each do |answer|
  # 3 comments from random users
  answer.comments.create(user: users.sample, content: Faker::Pokemon.name)
  answer.comments.create(user: users.sample, content: Faker::Pokemon.name)
  answer.comments.create(user: users.sample, content: Faker::Pokemon.name)

  # 3 votes from random users
  answer.votes.create(user: users.sample)
  answer.votes.create(user: users.sample)
  answer.votes.create(user: users.sample)
end