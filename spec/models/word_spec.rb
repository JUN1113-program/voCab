require 'rails_helper'
describe Word do

  context "登録できる場合" do

    it "すべての値が適切に入力されている" do
      word = build(:word)
      expect(word).to be_valid
    end

    it "frontが30文字" do
      word = build(:word, front: Faker::Alphanumeric.alpha(number: 30))
      expect(word).to be_valid
    end

    it "reverseが30文字" do
      word = build(:word, reverse: Faker::Alphanumeric.alpha(number: 30))
      expect(word).to be_valid
    end

  end
end