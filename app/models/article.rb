class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 2 , maximum: 10}, uniqueness: true
  validates :description, presence: true, length: {minimum: 2 , maximum: 10}
  validates :user_id, presence: true
end