module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def flash_classes(flash_type)
    base_classes = "rounded-xl p-4 mb-4 border transition-all duration-300 transform animate-slide-down"
    
    case flash_type.to_s
    when 'notice', 'success'
      "#{base_classes} bg-green-50 border-green-200 text-green-800"
    when 'alert', 'error'
      "#{base_classes} bg-red-50 border-red-200 text-red-800"
    when 'warning'
      "#{base_classes} bg-yellow-50 border-yellow-200 text-yellow-800"
    when 'info'
      "#{base_classes} bg-blue-50 border-blue-200 text-blue-800"
    else
      "#{base_classes} bg-neutral-50 border-neutral-200 text-neutral-800"
    end
  end

  def flash_icon(flash_type)
    case flash_type.to_s
    when 'notice', 'success'
      '<svg class="h-5 w-5 text-green-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
      </svg>'.html_safe
    when 'alert', 'error'
      '<svg class="h-5 w-5 text-red-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
      </svg>'.html_safe
    when 'warning'
      '<svg class="h-5 w-5 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z"></path>
      </svg>'.html_safe
    when 'info'
      '<svg class="h-5 w-5 text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
      </svg>'.html_safe
    else
      '<svg class="h-5 w-5 text-neutral-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
      </svg>'.html_safe
    end
  end
end
