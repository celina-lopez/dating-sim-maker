class StoriesController < ApplicationController
  before_action :authenticate!
  before_action :set_story, except: [:index, :new, :create]

  def index
    @stories = current_user.stories
  end

  def new
    @story = Story.new
    respond_with(@story)
  end

  def create
    result = Stories::Create.call(story_params.merge({ user: current_user }))
    if result.success?
      @story = result.story
      respond_with(@story, location: -> { stories_path })
    else
      render :new
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(
        :id,
        :title,
        :description,
        :status,
      )
    end
end
