class Admin::FormComponent < ViewComponent::Base
  def initialize(form_object:, title: nil, submit_text: "Save", cancel_path: nil, fields: [], parent_objects: [])
    @form_object = form_object
    @title = title
    @submit_text = submit_text
    @cancel_path = cancel_path
    @fields = fields
    @parent_objects = parent_objects
  end

  private

  attr_reader :form_object, :title, :submit_text, :cancel_path, :fields, :parent_objects

  def form_model
    if parent_objects.any?
      [:admin] + parent_objects + [form_object]
    else
      [:admin, form_object]
    end
  end

  def form_title
    return title if title.present?
    form_object.persisted? ? "Edit #{form_object.class.name.humanize}" : "New #{form_object.class.name.humanize}"
  end

  def field_classes
    "w-full px-4 py-3 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors duration-300 font-body"
  end

  def label_classes
    "block text-sm font-body font-medium text-neutral-700"
  end

  def render_field(form, field)
    case field[:type]
    when :text
      render_text_field(form, field)
    when :email
      render_email_field(form, field)
    when :number
      render_number_field(form, field)
    when :date
      render_date_field(form, field)
    when :time
      render_time_field(form, field)
    when :select
      render_select_field(form, field)
    when :textarea
      render_textarea_field(form, field)
             when :checkbox
           render_checkbox_field(form, field)
         when :file
           render_file_field(form, field)
         else
           render_text_field(form, field)
         end
  end

  def render_text_field(form, field)
    form.text_field field[:name], 
          placeholder: field[:placeholder],
          autofocus: field[:autofocus],
          class: field_classes
  end

  def render_email_field(form, field)
    form.email_field field[:name], 
          placeholder: field[:placeholder],
          class: field_classes
  end

  def render_number_field(form, field)
    form.number_field field[:name], 
          in: field[:range] || (1..10000),
          step: field[:step] || 1,
          placeholder: field[:placeholder],
          class: field_classes
  end

  def render_date_field(form, field)
    form.date_field field[:name], 
          class: field_classes
  end

  def render_time_field(form, field)
    form.time_field field[:name], 
          class: field_classes
  end

  def render_select_field(form, field)
    form.select field[:name], 
          field[:options], 
          { prompt: field[:prompt] },
          class: field_classes
  end

  def render_textarea_field(form, field)
    form.text_area field[:name], 
          rows: field[:rows] || 4,
          placeholder: field[:placeholder],
          class: "#{field_classes} resize-none"
  end

    def render_checkbox_field(form, field)
    form.check_box field[:name],
          class: "h-5 w-5 text-primary-600 focus:ring-primary-500 border-neutral-300 rounded transition-all duration-200"
  end

  def render_file_field(form, field)
    form.file_field field[:name],
          accept: field[:accept] || "image/*",
          class: field_classes
  end
end
