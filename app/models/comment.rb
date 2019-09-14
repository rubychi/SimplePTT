class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true

  scope :num_of_likes, -> (postId) { select('count(*)').where('post_id=? AND "like" = true', postId) }
  scope :num_of_dislikes, -> (postId) { select('count(*)').where('post_id=? AND "dislike" = true', postId) }
  scope :liked?, -> (postId, userId) { select('count(*)').where('post_id=? AND user_id=? AND "like" = true', postId, userId) }
  scope :disliked?, -> (postId, userId) { select('count(*)').where('post_id=? AND user_id=? AND dislike = true', postId, userId) }
end
