class Shared::ButtonComponent < ViewComponent::Base
  def initialize(text:, link: nil, variant: :primary, size: :medium, full_width: false, **options)
    @text = text
    @link = link
    @variant = variant
    @size = size
    @full_width = full_width
    @options = options
  end

  private

  attr_reader :text, :link, :variant, :size, :full_width, :options

  def button_classes
    base_classes = "inline-flex items-center justify-center font-medium rounded-xl transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 transform hover:scale-105 active:scale-95"
    
    variant_classes = case variant
    when :primary
      "bg-gradient-to-r from-primary-600 to-primary-700 text-white hover:from-primary-700 hover:to-primary-800 focus:ring-primary-500 shadow-medium hover:shadow-strong border border-primary-500/20"
    when :secondary
      "bg-gradient-to-r from-neutral-50 to-neutral-100 text-neutral-900 hover:from-neutral-100 hover:to-neutral-200 focus:ring-neutral-500 border border-neutral-300 shadow-soft hover:shadow-medium"
    when :accent
      "bg-gradient-to-r from-accent-600 to-accent-700 text-white hover:from-accent-700 hover:to-accent-800 focus:ring-accent-500 shadow-medium hover:shadow-strong border border-accent-500/20"
    when :outline
      "bg-transparent text-primary-600 hover:bg-primary-50 focus:ring-primary-500 border-2 border-primary-300 hover:border-primary-400 hover:shadow-soft"
    when :cta
      "bg-white text-primary-700 hover:bg-primary-50 hover:text-primary-800 focus:ring-primary-500 border-2 border-white hover:border-primary-200 hover:shadow-medium"
    else
      "bg-gradient-to-r from-primary-600 to-primary-700 text-white hover:from-primary-700 hover:to-primary-800 focus:ring-primary-500 shadow-medium hover:shadow-strong"
    end

    size_classes = case size
    when :small
      "px-3 py-2 text-sm"
    when :medium
      "px-4 py-2.5 text-base"
    when :large
      "px-6 py-3 text-lg"
    else
      "px-4 py-2.5 text-base"
    end

    width_classes = full_width ? "w-full" : ""

    "#{base_classes} #{variant_classes} #{size_classes} #{width_classes}".strip
  end

  def link?
    link.present?
  end
end
