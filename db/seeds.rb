# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  project = Project.create(
    title: 'Title project',
    start_date: DateTime.now,
    end_date: DateTime.now + 1.week
  )

  task = Task.create(
    title: 'Title task',
    start_date: DateTime.now,
    end_date: DateTime.now + 1.week,
    project_id: project.id
  )
