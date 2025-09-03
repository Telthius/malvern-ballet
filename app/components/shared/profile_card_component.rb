class Shared::ProfileCardComponent < ViewComponent::Base
  def initialize(name:, role:, bio:, image: nil)
    @name = name
    @role = role
    @bio = bio
    @image = image
  end

  private

  attr_reader :name, :role, :bio, :image
end
