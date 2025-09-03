class Shared::GalleryComponent < ViewComponent::Base
  def initialize(images:, title: nil, subtitle: nil, columns: 3, show_captions: true)
    @images = images
    @title = title
    @subtitle = subtitle
    @columns = columns
    @show_captions = show_captions
  end

  private

  attr_reader :images, :title, :subtitle, :columns, :show_captions

  def grid_classes
    case columns
    when 2
      "grid-cols-1 md:grid-cols-2"
    when 3
      "grid-cols-1 md:grid-cols-2 lg:grid-cols-3"
    when 4
      "grid-cols-1 md:grid-cols-2 lg:grid-cols-4"
    else
      "grid-cols-1 md:grid-cols-2 lg:grid-cols-3"
    end
  end
end
