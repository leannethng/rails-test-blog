# Defining the article
class Article < ApplicationRecord
  has_many :comments
  # Data validation for title
  validates :title, presence: true, length: { minimum: 5 }
end
