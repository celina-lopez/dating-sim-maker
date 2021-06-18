module Characters
  class BuildEmotions
    extend LightService::Action

    expects :params
    promises :emotions

    executed do |context|
      params = context.params
      emotions = {}

      Character::EMOTIONS.each do |emotion|
        if params[emotion].present?
          emotions[emotion] = params[emotion]
        end
      end
      
      context.emotions = emotions
    end
  end
end
