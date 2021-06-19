module Answers
  class BuildAnswers
    extend LightService::Action

    expects :params
    promises :answers

    executed do |context|
      params = context.params
      answers = []

      Option::OPTIONS.each do |answer|
        if params[answer].present?
          answers << params[answer]
        end
      end
      
      context.answers = answers
    end
  end
end
