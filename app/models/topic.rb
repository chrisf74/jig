class Topic < ActiveRecord::Base
  belongs_to :book

  def json_path
    Rails.root.join "content/#{slug}.json"
  end

  def json_string
  	@json_string ||= File.read(json_path)
  end

  def json_data
  	@json_data ||= JSON.parse(json_string)
  end
end
