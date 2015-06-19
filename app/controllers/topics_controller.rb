class TopicsController < ApplicationController
	def show
    @topic = Topic.find_by(slug: params[:id])
    respond_to do |format|
      format.pagejson { render json: @topic.json_string }
  	end
  end
end