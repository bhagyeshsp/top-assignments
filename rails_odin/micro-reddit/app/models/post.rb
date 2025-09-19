class Post < ApplicationRecord
  validates :body, :user_id, presence: true
  belongs_to :user
  has_many :comments
end
