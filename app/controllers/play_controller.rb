class PlayController < ApplicationController
  before_action :authenticate!
  before_action :set_story
  layout "story"

  def index
    @props = Jbuilder.new do |json|
      json.story do
        json.extract! @story, :title, :description
        json.chapters @story.chapters.order(:order_number) do |chapter|
          json.extract! chapter, :title, :background_image_url, :order_number
          json.lines chapter.lines do |line|
            json.extract! line, :line_type, :emotion, :text, :order
            json.character_id line.speakeable_id
            json.is_option line.option?
            json.speaker_name line.speaker_name
            json.mc line.mc?
            json.option do
              if line.option.present?
                json.extract! line.option, :answers, :weights
              end
            end
          end
        end
      end

      json.characters @story.characters do |character|
      end

    end.target!
  end

  private
    def set_story
      @story = Story.find(params[:story_id])
    end
end
