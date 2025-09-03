class Shared::TimetableComponent < ViewComponent::Base
  def initialize(timetable_classes:, timetable: nil, current_term: nil)
    @timetable_classes = timetable_classes
    @timetable = timetable
    @current_term = current_term
  end

  private

  attr_reader :timetable_classes, :timetable, :current_term

  def days
    [
      { name: "Monday", classes: organize_parallel_classes(timetable_classes.monday), day_key: :monday },
      { name: "Tuesday", classes: organize_parallel_classes(timetable_classes.tuesday), day_key: :tuesday },
      { name: "Wednesday", classes: organize_parallel_classes(timetable_classes.wednesday), day_key: :wednesday },
      { name: "Thursday", classes: organize_parallel_classes(timetable_classes.thursday), day_key: :thursday },
      { name: "Friday", classes: organize_parallel_classes(timetable_classes.friday), day_key: :friday },
      { name: "Saturday", classes: organize_parallel_classes(timetable_classes.saturday), day_key: :saturday }
    ]
  end

  def format_time(time)
    time.strftime("%I:%M%p")
  end

  def time_to_minutes(time)
    time.hour * 60 + time.min
  end

  def calculate_class_position(start_time)
    # Calculate position from top based on start time (assuming 6 AM start)
    start_minutes = time_to_minutes(start_time)
    base_minutes = 6 * 60 # 6 AM
    ((start_minutes - base_minutes) / 60.0) * 3 # 3rem per hour (more compressed)
  end

  def calculate_class_height(start_time, end_time)
    # Calculate height based on duration
    duration_minutes = time_to_minutes(end_time) - time_to_minutes(start_time)
    (duration_minutes / 60.0) * 3 # 3rem per hour (more compressed)
  end

  def class_level_color(level_id)
    # Generate consistent colors for different ballet levels
    colors = [
      "from-primary-500 to-primary-600",
      "from-accent-500 to-accent-600", 
      "from-purple-500 to-purple-600",
      "from-emerald-500 to-emerald-600",
      "from-rose-500 to-rose-600",
      "from-amber-500 to-amber-600"
    ]
    colors[level_id % colors.length]
  end

  def time_slots
    # Generate time slots for the left side (6 AM to 10 PM)
    (6..22).map do |hour|
      {
        time: Time.current.change(hour: hour, min: 0),
        label: hour < 12 ? "#{hour}AM" : hour == 12 ? "12PM" : "#{hour - 12}PM"
      }
    end
  end

  def filter_classes_by_time(classes)
    return [] unless classes.present?
    
    classes.select do |class_time|
      start_hour = class_time.start_time.hour
      end_hour = class_time.end_time.hour
      # Only include classes that start and end between 6 AM and 10 PM
      start_hour >= 6 && end_hour <= 22
    end
  end

  def organize_parallel_classes(classes)
    return [] unless classes.present?
    
    filtered_classes = filter_classes_by_time(classes)
    return [] if filtered_classes.empty?
    
    # Group classes by overlapping time periods
    organized = []
    filtered_classes.each do |class_time|
      overlapping = organized.select do |existing|
        # Check if classes overlap in time
        (class_time.start_time < existing[:end_time] && class_time.end_time > existing[:start_time])
      end
      
      if overlapping.empty?
        # No overlap, add as first column
        organized << {
          class_time: class_time,
          column: 0,
          start_time: class_time.start_time,
          end_time: class_time.end_time
        }
      else
        # Find next available column
        used_columns = overlapping.map { |c| c[:column] }
        available_column = (0..used_columns.max + 1).find { |col| !used_columns.include?(col) }
        
        organized << {
          class_time: class_time,
          column: available_column,
          start_time: class_time.start_time,
          end_time: class_time.end_time
        }
      end
    end
    
    organized
  end
end
