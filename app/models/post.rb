class Post < ActiveRecord::Base
  paginates_per 50
  belongs_to :user
  validates_length_of :body, maximum: 170

  def self.timeline(user)
    following_ids = user.all_following.map(&:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end
  
end
