FactoryBot.define do

  factory :word do
    front              {"表の言葉"}
    reverse             {"裏の言葉"}
    wordbook
  end

end