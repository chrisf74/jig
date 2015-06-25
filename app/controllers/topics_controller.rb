class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end
	def show
    @topic = Topic.find_by(slug: params[:id])
    respond_to do |format|
      format.json { render json: @topic.json_string }
  	end
  end
end