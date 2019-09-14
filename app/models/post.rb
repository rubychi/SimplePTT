class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :comments
  validates :title, :content, presence: true

  scope :recent, -> { order('created_at DESC') }
end
