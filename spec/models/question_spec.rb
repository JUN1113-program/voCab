require 'rails_helper'
describe Question do

  context "登録できる場合" do

    it "すべての値が適切に入力されている" do
      question = build(:question)
      expect(question).to be_valid
    end

  end

end