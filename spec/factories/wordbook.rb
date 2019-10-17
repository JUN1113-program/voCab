FactoryBot.define do

  factory :wordbook do
    title              {"タイトル"}
    viewed             {0}
    share              {false}
    reference          {"参考元"}
    user
  end

end