# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
membership_plan = MembershipPlan.create!(name: 'premium')
Procedure.create!(name: 'procedure 1', price: 100)
Procedure.create!(name: 'procedure 2', price: 200)
Procedure.create!(name: 'procedure 3', price: 300)

Member.create!(
    membership_plans_id: membership_plan.id,
    membership_start_date: Time.now,
    membership_end_date: Time.new('2022-01-01')
)