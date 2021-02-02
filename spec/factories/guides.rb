FactoryBot.define do
  factory :guide do
    title                { 'test' }
    content              { 'sample' }
    association :user

    after(:build) do |guide|
      guide.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
