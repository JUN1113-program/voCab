FactoryBot.define do

  factory :testresult do
    score        {Faker::Number.within(range: 0..100)}
    user
    test
  end

end