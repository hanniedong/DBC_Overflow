class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  # def current_date_time
  # 	DateTime.now
  # end
end
