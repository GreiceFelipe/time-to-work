# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.all.blank?
    user = User.create(email: 'text@exemple.com', password:'123456')

    i = 10
    until i < 0  do
        w = WorkHistory.new(starts_at: Time.now-i.days)
        w.ends_at = w.starts_at + 9.hours
        w.user_id = user.id
        w.save!
        puts w.id
        i -= 1
    end
end