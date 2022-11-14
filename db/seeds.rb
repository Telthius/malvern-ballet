# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Timetable.create([{year: '2022', term: '1', isactive: false}, {year: '2022', term: '2', isactive: false}, {year: '2022', term: '3', isactive: false}, {year: '2022', term: '4', isactive: false}])
grade_3 = BalletLevel.create!(name: "Grade 3", description: "a grade 3 class")
grade_4 = BalletLevel.create!(name: "Grade 4", description: "a grade 4 class")
timetable_1 = Timetable.create!(term: '4', start_date: DateTime.new(2022, 8, 15), end_date: DateTime.new(2022, 11, 15))
class_3 = BalletClass.create!(ballet_level_id: grade_3.id) # (has enrolments)
class_4 = BalletClass.create!(ballet_level_id: grade_4.id) # (has enrolments)


ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: class_3.id, day_of_week: "Thursday", start_time: "16:30", end_time: "17:30")
ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: class_4.id, day_of_week: "Friday", start_time: "19:00", end_time: "20:00")
ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: class_3.id, day_of_week: "Tuesday", start_time: "13:30", end_time: "14:30")
ClassTime.create!(timetable_id: timetable_1.id, ballet_class_id: class_4.id, day_of_week: "Thursday", start_time: "16:00", end_time: "17:00")