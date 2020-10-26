class StoriesController < ApplicationController

  before_action :set_story, except: [:index, :new, :create]

  def index
  end

  def new
    @story = Story.new
    respond_with(@story)
  end

  def create
  end

  def show
  end

  def update
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    def upload_story_params
      params.require(:story).permit()
    end
end
