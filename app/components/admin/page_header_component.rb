class Admin::PageHeaderComponent < ViewComponent::Base
  def initialize(title:, subtitle: nil, actions: [])
    @title = title
    @subtitle = subtitle
    @actions = actions
  end

  private

  attr_reader :title, :subtitle, :actions

  def default_action_classes(variant)
    base_classes = "inline-flex items-center px-6 py-3 font-body font-semibold rounded-xl shadow-strong hover:shadow-strong transition-all duration-300 transform hover:-translate-y-1 focus:outline-none focus:ring-2 focus:ring-offset-2"
    
    case variant
    when :primary
      "#{base_classes} bg-gradient-to-r from-primary-600 to-primary-700 text-white hover:from-primary-700 hover:to-primary-800 focus:ring-primary-500"
    when :secondary
      "#{base_classes} bg-white text-neutral-600 border-2 border-neutral-200 hover:border-neutral-300 hover:bg-neutral-50 focus:ring-neutral-500"
    when :accent
      "#{base_classes} bg-gradient-to-r from-accent-600 to-accent-700 text-white hover:from-accent-700 hover:to-accent-800 focus:ring-accent-500"
    else
      "#{base_classes} bg-gradient-to-r from-primary-600 to-primary-700 text-white hover:from-primary-700 hover:to-primary-800 focus:ring-primary-500"
    end
  end
end
