class Book < ActiveRecord::Base
  has_many :topics
  has_many :questions
end
