module Lines
  class BuildOrder
    extend LightService::Action
# will be for both updating rest of orders and this one
    expects :chapter, :line
    promises :order_number

    executed do |context|
      line = context.line
      chapter = context.chapter

      context.order_number = if line.new_record?
        (chapter.lines.last&.order.presence || -1) + 1
      else
        line.order
      end
    end
  end
end
