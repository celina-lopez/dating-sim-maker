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
        json.id character.id
      end
      json.lines context.chapter.lines do |line|
        json.characterId line.speakeable_id
        json.text line.text
        idx = 0
        json.options line.option&.answers do |answer|
          json.option answer
          json.weight line.option&.weights[idx]
          idx += 1
        end
      end
      context.chapter_json = json
    end
  end
end
