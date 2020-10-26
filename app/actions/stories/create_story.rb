module Stories
  STORY_CREATE_ERROR = 100.freeze
  class CreateStory
    extend LightService::Action

    expects :story_params
    promises :story

    executed do |context|
      story_params = context.story_params
      context.story = Story.new(story_params)
      if context.story.save
        next context
      else
        context.fail!("Dating Sim failed to create :(", error_code: TEST_GROUP_CREATE_ERROR)
        next context
      end
    end
  end
end