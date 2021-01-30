FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { 'test10310' }
    password_confirmation { password }
    nickname              { Faker::Internet.username }
    age_id                { 2 }
    sex_id                { 2 }
    profession            { '公務員' }
  end
end
