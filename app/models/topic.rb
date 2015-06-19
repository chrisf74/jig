class Topic < ActiveRecord::Base
  belongs_to :book

  def json_string
  	@json_string ||= File.read("content/#{slug}.json")
  end
end
