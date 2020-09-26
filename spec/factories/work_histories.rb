FactoryBot.define do
  factory :work_history do
    starts_at { Faker::Time.forward(days: 23, period: :morning) }
    user { create(:user) }
  end
end
