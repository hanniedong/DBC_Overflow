class Question < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, presence: true
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable


  def total_votes
      votes.count
  end
end
