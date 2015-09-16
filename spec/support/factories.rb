FactoryGirl.define do
  sequence(:email){ |n| "test_email#{n}@test.com"}
  pw ='AbC123!!'


  factory :event do
    name { Faker::Company.bs.titlecase }
    start_time Time.now + Random.rand(1..800).hours.minutes

    factory :published_event do
      published true
    end

    factory :archived_event do
      published true
    end

    factory :draft_event do
    end
  end

end