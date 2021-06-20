class StorycharactersController < ApplicationController
  before_action :authenticate!
  before_action :set_story

  def index
    @characters = @story.characters
    page = params[:page] || 1

    @characters = @characters
      .page(page)
      .per(10)
  end

  def new
    @characters = @story.characters
    @story_character = Storycharacter.new
  end

  def create
    @story_character = Storycharacter.new(story_character_params.merge({story: @story}))
    if @story_character.save
      redirect_to story_storycharacters_path(@story)
    else
      render :new
    end
  end

  def destroy
  end

  private
    def set_story
      @story = Story.find(params[:story_id])
    end

    def story_character_params
      params.require(:storycharacter).permit(:character_id)
    end
end
