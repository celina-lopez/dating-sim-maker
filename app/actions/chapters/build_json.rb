module Chapters
  class BuildJson
    extend LightService::Action
# will be for both updating rest of orders and this one
    expects :story, :chapter, :json
    promises :chapter_json

    executed do |context|
      json = context.json
      json.post_url = "/#{context.story.uid}/chapters/#{context.chapter.id}/lines/"
      json.background context.chapter.background_image_url
      json.characters context.story.characters do |character|
        json.name character.name
        json.Defaultimage character.emotions["default"]
        json.id character.id
      end
      json.lines context.chapter.lines do |line|
        json.characterId line.speakeable_id
        json.text line.text
        json.line_id line.id
      end
      options = {}
      context.chapter.lines.each do |line|
        if line.option.present?
          options[line.id] = [line.option.answers, line.option.weights]
        end
      end
      new_options = []
      options.keys.each do |option|
        options[option][0].zip(options[option][1]).each do |answer, weight|
          new_options.append({text: answer, weight: weight, line_id: option.to_i})
        end
      end
      json.options new_options
      context.chapter_json = json
    end
  end
end
