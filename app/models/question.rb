class Question < ActiveRecord::Base
  has_many :responses
  belongs_to :book
  belongs_to :quiz
end
