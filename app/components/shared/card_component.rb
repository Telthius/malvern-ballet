class Shared::CardComponent < ViewComponent::Base
  def initialize(title: nil, subtitle: nil, image: nil, footer: nil, padding: :medium, shadow: :medium, **options)
    @title = title
    @subtitle = subtitle
    @image = image
    @footer = footer
    @padding = padding
    @shadow = shadow
    @options = options
  end

  private

  attr_reader :title, :subtitle, :image, :footer, :padding, :shadow, :options

  def card_classes
    base_classes = "bg-white rounded-xl border border-neutral-200 overflow-hidden"
    
    shadow_classes = case shadow
    when :soft
      "shadow-soft"
    when :medium
      "shadow-medium"
    when :strong
      "shadow-strong"
    else
      "shadow-medium"
    end

    padding_classes = case padding
    when :small
      "p-4"
    when :medium
      "p-6"
    when :large
      "p-8"
    else
      "p-6"
    end

    "#{base_classes} #{shadow_classes} #{padding_classes}".strip
  end

  def has_image?
    image.present?
  end

  def has_footer?
    footer.present?
  end
end
