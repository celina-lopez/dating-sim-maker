module Stories
  class Create
    extend LightService::Organizer

    def self.call(story_params)
      with(
        :story_params => story_params,
      ).reduce(
        Stories::CreateStory,
      )
    end
  end
end
