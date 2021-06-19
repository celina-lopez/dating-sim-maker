module Answers
  class BuildWeights
    extend LightService::Action

    expects :params
    promises :weights

    executed do |context|
      params = context.params
      weights = []

      Option::WEIGHTS.each do |weight|
        if params[weight].present?
          weights.push(params[weight])
        end
      end
      
      context.weights = weights
    end
  end
end
