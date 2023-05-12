class PlayController < ApplicationController
  before_action :authenticate!
  before_action :set_story
  layout "story"

  def index
    chapter = @story.chapters.find_by_order_number(params[:current_chapter_index] || 0)
    @props = Jbuilder.new do |json|
      json.extract! @story, :title, :description
      json.chapter do
        json.extract! chapter, :title, :background_image_url, :order_number
        json.lines chapter.lines do |line|
          json.extract! line, :line_type, :text, :order
          character = line.mc? ?
            Character.new(name: "MC", emotions: {}) : @story.characters.find(line.speakeable_id) 
          json.character do
            json.extract! character, :name
            json.emotion_url character.emotions[line.emotion]
          end
          json.is_option line.option?
          json.speaker_name line.speaker_name
          json.option do
            if line.option.present?
              json.extract! line.option, :answers, :weights
            end
          end
        end
      end
    end.target!
  end

  private
    def set_story
      @story = Story.find(params[:story_id])
    end
end
