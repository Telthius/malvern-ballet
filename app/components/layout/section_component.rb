class Layout::SectionComponent < ViewComponent::Base
  def initialize(padding: :default, background: :white, container: :default)
    @padding = padding
    @background = background
    @container = container
  end

  private

  attr_reader :padding, :background, :container

  def padding_classes
    case padding
    when :compact
      "py-8"
    when :large
      "py-20"
    else
      "py-16"
    end
  end

  def background_classes
    case background
    when :light
      "bg-neutral-50"
    when :accent
      "bg-accent-50"
    when :dark
      "bg-neutral-900 text-white"
    else
      "bg-white"
    end
  end

  def container_classes
    case container
    when :narrow
      "max-w-4xl mx-auto px-4 sm:px-6 lg:px-8"
    when :wide
      "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"
    else
      "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"
    end
  end
end
