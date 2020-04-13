# Defining the article
class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  # Data validation for title
  validates :title, presence: true, length: { minimum: 5 }
end
