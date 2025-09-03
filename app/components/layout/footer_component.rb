class Layout::FooterComponent < ViewComponent::Base
  def initialize
  end

  private

  def current_year
    Date.current.year
  end
end
