class Admin::ListComponent < ViewComponent::Base
  def initialize(title:, items:, empty_state: nil, turbo_frame: nil)
    @title = title
    @items = items
    @empty_state = empty_state
    @turbo_frame = turbo_frame
  end

  private

  attr_reader :title, :items, :empty_state, :turbo_frame

  def has_items?
    items.respond_to?(:any?) ? items.any? : items.present?
  end

  def empty_state_content
    return empty_state if empty_state.present?
    
    {
      icon: default_empty_icon,
      title: "No #{title.downcase} yet",
      description: "Get started by creating your first #{title.downcase.singularize}.",
      action: nil
    }
  end

  def default_empty_icon
    content_tag :svg, class: "w-8 h-8 text-neutral-400", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
      content_tag :path, "", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2", d: "M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
    end
  end

  def render_list_content
    if has_items?
      content_tag :div, class: "space-y-4" do
        render items
      end
    else
      content_tag :div, class: "text-center py-12" do
        content_tag(:div, class: "w-16 h-16 mx-auto mb-4 bg-gradient-to-br from-neutral-100 to-neutral-200 rounded-full flex items-center justify-center") do
          empty_state_content[:icon]
        end +
        content_tag(:h3, empty_state_content[:title], class: "text-lg font-display font-medium text-neutral-800 mb-2") +
        content_tag(:p, empty_state_content[:description], class: "text-neutral-600 font-body mb-6") +
        (empty_state_content[:action].present? ? 
          link_to(
            empty_state_content[:action][:text], 
            empty_state_content[:action][:path], 
            class: empty_state_content[:action][:class] || "btn btn-primary"
          ) : 
          ""
        )
      end
    end
  end
end
