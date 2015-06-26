class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

	def show
    @topic = Topic.find_by(slug: params[:id])
    @topic_data = @topic.json_data()
  end
end