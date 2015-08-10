class Post < ActiveRecord::Base
  paginates_per 50
  belongs_to :user
  validates_length_of :body, maximum: 170
end
