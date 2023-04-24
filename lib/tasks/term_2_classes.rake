namespace :classes do
  desc "adds term 2 classes"
  task :add_term2 => :environment do
    timetable_2 = Timetable.create!(term: '2', start_date: DateTime.new(2023, 4, 24), end_date: DateTime.new(2023, 7, 1))

    mummy_class = BalletClass.create!(ballet_level_id: 1)
    preschool_class = BalletClass.create!(ballet_level_id: 2) 
    pre_primary_class = BalletClass.create!(ballet_level_id: 3)
    primary_class = BalletClass.create!(ballet_level_id: 4)
    grade_1_class = BalletClass.create!(ballet_level_id: 5)
    grade_2_class = BalletClass.create!(ballet_level_id: 6)
    grade_3_class = BalletClass.create!(ballet_level_id: 7)
    grade_4_class = BalletClass.create!(ballet_level_id: 8)
    intermediate_foundation_class = BalletClass.create!(ballet_level_id: 11)
    intermediate_class = BalletClass.create!(ballet_level_id: 12)
    advanced_foundation_class = BalletClass.create!(ballet_level_id: 13)
    booty_barre_class = BalletClass.create!(ballet_level_id: 14)
    open_class = BalletClass.create!(ballet_level_id: 15)
    
    #CLASSTIMES
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: advanced_foundation_class.id, day_of_week: "Saturday", start_time: "8:30am", end_time: "9:45am")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: preschool_class.id, day_of_week: "Saturday", start_time: "10:00am", end_time: "10:30am")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: primary_class.id, day_of_week: "Saturday", start_time: "10:30am", end_time: "11:15am")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: grade_1_class.id, day_of_week: "Saturday", start_time: "11:15am", end_time: "12:00pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: primary_class.id, day_of_week: "Monday", start_time: "3:30pm", end_time: "4:20pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: grade_1_class.id, day_of_week: "Monday", start_time: "4:20pm", end_time: "5:20pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: intermediate_foundation_class.id, day_of_week: "Monday", start_time: "5:20pm", end_time: "6:30pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: intermediate_class.id, day_of_week: "Monday", start_time: "6:30pm", end_time: "7:45pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: open_class.id, day_of_week: "Tuesday", start_time: "4:50pm", end_time: "6:00pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: intermediate_foundation_class.id, day_of_week: "Tuesday", start_time: "6:10pm", end_time: "7:20pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: preschool_class.id, day_of_week: "Wednesday", start_time: "11:00am", end_time: "11:30am")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: advanced_foundation_class.id, day_of_week: "Wednesday", start_time: "5:45pm", end_time: "7:15pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: grade_2_class.id, day_of_week: "Thursday", start_time: "4:00pm", end_time: "5:00pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: grade_3_class.id, day_of_week: "Thursday", start_time: "5:00pm", end_time: "6:00pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: grade_2_class.id, day_of_week: "Friday", start_time: "4:00pm", end_time: "5:00pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: grade_3_class.id, day_of_week: "Friday", start_time: "5:00pm", end_time: "6:00pm")
    ClassTime.create!(timetable_id: timetable_2.id, ballet_class_id: intermediate_class.id, day_of_week: "Friday", start_time: "6:00pm", end_time: "7:30pm")
  end
end
