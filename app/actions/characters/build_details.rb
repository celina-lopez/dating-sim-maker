module Characters
  class BuildDetails
    extend LightService::Action

    expects :params
    promises :details

    executed do |context|
      params = context.params
      details = {}

      Character::DETAILS.each do |detail|
        if params[detail].present?
          details[detail] = params[detail]
        end
      end
      
      context.details = details
    end
  end
end
