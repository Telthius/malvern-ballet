class Admin::CardComponent < ViewComponent::Base
  def initialize(title:, subtitle: nil, actions: [], turbo_frame: nil)
    @title = title
    @subtitle = subtitle
    @actions = actions
    @turbo_frame = turbo_frame
  end

  private

  attr_reader :title, :subtitle, :actions, :turbo_frame

  def default_action_classes(variant)
    base_classes = "inline-flex items-center px-4 py-2 text-sm font-body font-medium rounded-lg transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2"
    
    case variant
    when :primary
      "#{base_classes} bg-primary-600 text-white hover:bg-primary-700 focus:ring-primary-500"
    when :secondary
      "#{base_classes} bg-white text-neutral-600 border border-neutral-300 hover:bg-neutral-50 focus:ring-neutral-500"
    when :danger
      "#{base_classes} bg-red-600 text-white hover:bg-red-700 focus:ring-red-500"
    when :accent
      "#{base_classes} bg-accent-600 text-white hover:bg-accent-700 focus:ring-accent-500"
    else
      "#{base_classes} bg-primary-600 text-white hover:bg-primary-700 focus:ring-primary-500"
    end
  end
end
