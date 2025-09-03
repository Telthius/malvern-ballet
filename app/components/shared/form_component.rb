class Shared::FormComponent < ViewComponent::Base
  def initialize(form_object:, title: nil, submit_text: "Submit", submit_variant: :primary)
    @form_object = form_object
    @title = title
    @submit_text = submit_text
    @submit_variant = submit_variant
  end

  private

  attr_reader :form_object, :title, :submit_text, :submit_variant

  def submit_button_classes
    base_classes = "inline-flex items-center justify-center px-8 py-4 font-body font-semibold rounded-xl transition-all duration-300 transform hover:-translate-y-1 focus:outline-none focus:ring-2 focus:ring-offset-2"
    
    case submit_variant
    when :primary
      "#{base_classes} bg-gradient-to-r from-primary-600 to-primary-700 text-white shadow-strong hover:shadow-strong hover:from-primary-700 hover:to-primary-800 focus:ring-primary-500"
    when :accent
      "#{base_classes} bg-gradient-to-r from-accent-600 to-accent-700 text-white shadow-strong hover:shadow-strong hover:from-accent-700 hover:to-accent-800 focus:ring-accent-500"
    when :outline
      "#{base_classes} bg-transparent text-primary-600 border-2 border-primary-600 hover:bg-primary-600 hover:text-white focus:ring-primary-500"
    else
      "#{base_classes} bg-gradient-to-r from-primary-600 to-primary-700 text-white shadow-strong hover:shadow-strong hover:from-primary-700 hover:to-primary-800 focus:ring-primary-500"
    end
  end
end
