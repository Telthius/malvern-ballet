# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

mummy = BalletLevel.create!(name: "Mummy and Me", description: "a grade 3 class")
preschool = BalletLevel.create!(name: "Preschool", description: "a grade 3 class")
pre_primary = BalletLevel.create!(name: "Pre-Primary", description: "a grade 4 class")
primary = BalletLevel.create!(name: "Primary", description: "a grade 3 class")
grade_1 = BalletLevel.create!(name: "Grade 1", description: "a grade 4 class")
grade_2 = BalletLevel.create!(name: "Grade 2", description: "a grade 3 class")
grade_3 = BalletLevel.create!(name: "Grade 3", description: "a grade 4 class")
grade_4 = BalletLevel.create!(name: "Grade 4", description: "a grade 4 class")
grade_5 = BalletLevel.create!(name: "Grade 5", description: "a grade 4 class")
grade_6 = BalletLevel.create!(name: "Grade 6", description: "a grade 4 class")
intermediate_foundation = BalletLevel.create!(name: "Intermediate Foundation", description: "a grade 4 class")
intermediate = BalletLevel.create!(name: "Intermediate", description: "a grade 4 class")
advanced_foundation = BalletLevel.create!(name: "Advanced Foundation", description: "a grade 4 class")
booty_barre = BalletLevel.create!(name: "BootyBarre", description: "a grade 4 class")


timetable_4 = Timetable.create!(term: '4', start_date: DateTime.new(2022, 8, 15), end_date: DateTime.new(2022, 11, 15))


mummy_class = BalletClass.create!(ballet_level_id: mummy.id) # (has enrolments)
preschool_class = BalletClass.create!(ballet_level_id: preschool.id) # (has enrolments)
pre_primary_class = BalletClass.create!(ballet_level_id: pre_primary.id) # (has enrolments)
primary_class = BalletClass.create!(ballet_level_id: primary.id) # (has enrolments)
grade_1_class = BalletClass.create!(ballet_level_id: grade_1.id) # (has enrolments)
grade_2_class = BalletClass.create!(ballet_level_id: grade_2.id) # (has enrolments)
grade_3_class = BalletClass.create!(ballet_level_id: grade_3.id) # (has enrolments)
grade_4_class = BalletClass.create!(ballet_level_id: grade_4.id) # (has enrolments)
intermediate_foundation_class = BalletClass.create!(ballet_level_id: intermediate_foundation.id) # (has enrolments)
intermediate_class = BalletClass.create!(ballet_level_id: intermediate.id) # (has enrolments)
advanced_foundation_class = BalletClass.create!(ballet_level_id: advanced_foundation.id) # (has enrolments)
booty_barre_class = BalletClass.create!(ballet_level_id: booty_barre.id) # (has enrolments)


ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: mummy_class.id, day_of_week: "Wednesday", start_time: "10:00am", end_time: "10:20")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: preschool_class.id, day_of_week: "Wednesday", start_time: "11:00am", end_time: "11:30am")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: preschool_class.id, day_of_week: "Saturday", start_time: "9:30am", end_time: "10:00am")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: primary_class.id, day_of_week: "Monday", start_time: "3:30pm", end_time: "4:15pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: grade_1_class.id, day_of_week: "Monday", start_time: "4:15pm", end_time: "5:15pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: grade_1_class.id, day_of_week: "Friday", start_time: "3:30pm", end_time: "4:30pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: grade_2_class.id, day_of_week: "Thursday", start_time: "3:45pm", end_time: "4:45pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: grade_2_class.id, day_of_week: "Saturday", start_time: "10:45am", end_time: "11:55am")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: grade_3_class.id, day_of_week: "Thursday", start_time: "04:45pm", end_time: "5:45pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: grade_3_class.id, day_of_week: "Friday", start_time: "4:15pm", end_time: "5:15pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: grade_4_class.id, day_of_week: "Thursday", start_time: "5:45pm", end_time: "6:45pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: grade_4_class.id, day_of_week: "Friday", start_time: "5:15pm", end_time: "6:15pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: intermediate_foundation_class.id, day_of_week: "Wednesday", start_time: "6:30pm", end_time: "7:30pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: intermediate_foundation_class.id, day_of_week: "Thursday", start_time: "6:45pm", end_time: "7:45pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: intermediate_class.id, day_of_week: "Monday", start_time: "6:00pm", end_time: "7:00pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: intermediate_class.id, day_of_week: "Friday", start_time: "6:15pm", end_time: "7:15pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: advanced_foundation_class.id, day_of_week: "Wednesday", start_time: "7:00pm", end_time: "8:00pm")
ClassTime.create!(timetable_id: timetable_4.id, ballet_class_id: advanced_foundation_class.id, day_of_week: "Saturday", start_time: "12:00pm", end_time: "1:00pm")
