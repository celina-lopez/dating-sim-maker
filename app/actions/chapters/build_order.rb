module Chapters
  class BuildOrder
    extend LightService::Action
# will be for both updating rest of orders and this one
    expects :story, :chapter
    promises :order_number

    executed do |context|
      chapter = context.chapter
      story = context.story

      context.order_number = if chapter.new_record?
        (story.chapters.last&.order_number.presence || -1) + 1
      else
        chapter.order_number
      end
    end
  end
end
