class Api::TopicsController < ApplicationController
  
 
  before_action :set_sub
  before_action :set_topic, only: [:show, :update, :destroy]

  def index 
    render json: @sub.topics.all
  end

  def show 
    render json: @topic
  end 

  def create
    @topic = @sub.topics.new(topic_params)
    if @topic.save
      render json: @topic
    else
      render json: { errors: @topic.errors },  status: :unprocessable_entity
    end
  end

  def update

    if @topic.update(topic_params)
      render json: @topic
    else
      render json: { errors: @topic.errors },  status: :unprocessable_entity
    end
  end

  def destroy
    
    @topic.destroy
    render json: { message: 'Topic delete'}
  end

  private 

  def set_sub
    @sub = @sub.topics.find(params:[:sub_id])
  end
    
    def topic_params
      params.require(:topic).permit(:title, :body)
    end

    def set_topic
      @topic = @sub.topics.find(params[:id])
    end
end
