class Shared::ClassCardComponent < ViewComponent::Base
  def initialize(ballet_class:)
    @ballet_class = ballet_class
  end

  private

  attr_reader :ballet_class
end
