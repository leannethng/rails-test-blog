# Defining the article
class Article < ApplicationRecord
  # Data validation for title
  validates :title, presence: true, length: { minimum: 5 }
end
