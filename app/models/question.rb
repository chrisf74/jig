class Question < ActiveRecord::Base
  has_many :responses
  belongs_to :topic
  belongs_to :book
end
