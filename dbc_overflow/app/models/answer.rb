class Answer < ActiveRecord::Base
  # Remember to create a migration!
  validates :content, presence: true
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def total_votes
      votes.count
  end
end
