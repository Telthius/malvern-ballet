namespace :classes do
  desc "adds term 1 classes"
  task :add_term1_2024 => :environment do

    discovering_rep = BalletLevel.create!(name: "Discovering Repertoire", description: "Discovering Repertoire is a classical ballet performance programme designed by the Royal Academy of Dance. Uniquely, the programme includes well-known classical repertoire, meaning students will learn and dance choreography that they have seen on stage, set to music that they know and love. Suitable for students from age 12 through to adult, the three levels cater for beginners, those with some prior ballet experience, as well as the more advanced dancer.\n")
    discovering_rep_1 = Cost.create!(ballet_level_id: 16, amount: 365.00, condition: "2 classes per week + 1 open class")
    discovering_rep_class = BalletClass.create!(ballet_level_id: 16)
    discovering_rep.picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "classes", "discovering-rep.webp")), filename: 'adv-found.webp')

    timetable_1 = Timetable.create!(term: '1', start_date: DateTime.new(2024, 2, 7), end_date: DateTime.new(2024, 4, 13))

    mummy_class = BalletClass.create!(ballet_level_id: 1)
    preschool_class = BalletClass.create!(ballet_level_id: 2) 
    pre_primary_class = BalletClass.create!(ballet_level_id: 3)
    primary_class = BalletClass.create!(ballet_level_id: 4)
    grade_1_class = BalletClass.create!(ballet_level_id: 5)
    grade_2_class = BalletClass.create!(ballet_level_id: 6)
    grade_3_class = BalletClass.create!(ballet_level_id: 7)
    grade_4_class = BalletClass.create!(ballet_level_id: 8)
    grade_5_class = BalletClass.create!(ballet_level_id: 9)
    intermediate_foundation_class = BalletClass.create!(ballet_level_id: 11)
    intermediate_class = BalletClass.create!(ballet_level_id: 12)
    advanced_foundation_class = BalletClass.create!(ballet_level_id: 13)
    booty_barre_class = BalletClass.create!(ballet_level_id: 14)
    open_class = BalletClass.create!(ballet_level_id: 15)
    discovering_rep_class = BalletClass.create!(ballet_level_id: 16)
    
    #CLASSTIMES
  
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: preschool_class.id, day_of_week: "Saturday", start_time: "10:00am", end_time: "10:30am")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: grade_2_class.id, day_of_week: "Saturday", start_time: "10:30am", end_time: "11:30am")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: discovering_rep_class.id, day_of_week: "Saturday", start_time: "11:30am", end_time: "1:00pm")

    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: primary_class.id, day_of_week: "Monday", start_time: "3:30pm", end_time: "4:15pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: grade_1_class.id, day_of_week: "Monday", start_time: "4:15pm", end_time: "5:15pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: grade_5_class.id, day_of_week: "Monday", start_time: "5:15pm", end_time: "6:15pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: intermediate_foundation_class.id, day_of_week: "Monday", start_time: "6:30pm", end_time: "7:30pm")

    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: open_class.id, day_of_week: "Tuesday", start_time: "5:15pm", end_time: "6:00pm")

    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: mummy_class.id, day_of_week: "Wednesday", start_time: "10:00am", end_time: "10:20am")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: preschool_class.id, day_of_week: "Wednesday", start_time: "11:00am", end_time: "11:30am")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: pre_primary_class.id, day_of_week: "Wednesday", start_time: "3:30pm", end_time: "4:10pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: intermediate_foundation_class.id, day_of_week: "Wednesday", start_time: "4:10pm", end_time: "5:10pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: intermediate_class.id, day_of_week: "Wednesday", start_time: "5:10pm", end_time: "6:30pm")

    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: grade_1_class.id, day_of_week: "Thursday", start_time: "3:30pm", end_time: "4:30pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: grade_3_class.id, day_of_week: "Thursday", start_time: "4:30pm", end_time: "5:30pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: grade_4_class.id, day_of_week: "Thursday", start_time: "5:30pm", end_time: "6:30pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: discovering_rep_class.id, day_of_week: "Thursday", start_time: "6:30pm", end_time: "7:45pm")

    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: grade_2_class.id, day_of_week: "Friday", start_time: "3:30pm", end_time: "4:30pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: grade_3_class.id, day_of_week: "Friday", start_time: "5:30pm", end_time: "6:30pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: grade_4_class.id, day_of_week: "Friday", start_time: "6:30pm", end_time: "7:30pm")
    ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: intermediate_class.id, day_of_week: "Friday", start_time: "6:45pm", end_time: "8:00pm")
  end
end
