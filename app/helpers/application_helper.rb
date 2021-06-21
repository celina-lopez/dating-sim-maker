module ApplicationHelper
  def card_color(idx)
    number = idx % 4
    if number == 0
      "text-white bg-lavender"
    elsif number == 1
      "bg-yellow text-white"
    elsif number == 2
      "bg-orange text-white"
    else
      "bg-hot-pink text-white"
    end
  end

  def clean_array(param)
    param&.filter { |k| k.present? }
  end

  def clean_jsonb(param)
    if param.present?
      JSON.parse(param)
    elsif param == ""
      {}
    end
  end
end
