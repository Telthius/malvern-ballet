class Shared::CtaComponent < ViewComponent::Base
  def initialize(title:, subtitle:, button_text:, button_link:, background: :blue)
    @title = title
    @subtitle = subtitle
    @button_text = button_text
    @button_link = button_link
    @background = background
  end

  private

  attr_reader :title, :subtitle, :button_text, :button_link, :background

  def background_classes
    case background
    when :blue
      "from-primary-600 via-primary-700 to-primary-800"
    when :accent
      "from-accent-600 to-accent-700"
    when :neutral
      "from-primary-500 via-accent-500 to-primary-600"
    else
      "from-primary-600 via-primary-700 to-primary-800"
    end
  end
end
