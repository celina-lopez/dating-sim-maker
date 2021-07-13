module Chapters
  class BuildJson
    extend LightService::Action
# will be for both updating rest of orders and this one
    expects :story, :chapter, :json
    promises :chapter_json

    executed do |context|
      json = context.json
      json.background context.chapter.background_image_url
      json.characters context.story.characters do |character|
        json.name character.name
        json.Defaultimage character.emotions["default"]
      end
      json.lines context.chapter.lines do |line|
        json.characterId line.speakeable_id
        json.text line.text
      end
      context.chapter_json = json
    end
  end
end
