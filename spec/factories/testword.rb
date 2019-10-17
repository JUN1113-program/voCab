FactoryBot.define do

  factory :testword do
    word              {"test"}
    correct           {Faker::Number.within(range: 0..1)}
    question
  end

end