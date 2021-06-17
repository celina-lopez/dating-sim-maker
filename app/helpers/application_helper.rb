module ApplicationHelper
  def card_color(idx)
    number = idx % 4
    if number == 0
      "text-white bg-lavender"
    elsif number == 1
      "bg-yellow"
    elsif number == 2
      "bg-orange text-white"
    else
      "bg-hot-pink text-white"
    end
  end
end
