module AdminHelper
  def phone_bg_color(state)
    case state.to_sym
    when :prepared
      "bg-gray-200"
    when :open
      "bg-teal-200"
    when :closed
      "bg-rose-200"
    when :evaluated
      "bg-blue-200"
    end
  end
end
