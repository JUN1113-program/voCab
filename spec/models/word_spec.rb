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

  context "登録できない場合" do

    it "frontが未入力である" do
      word = build(:word, front: "")
      word.valid?
      expect(word.errors[:front]).to include("を入力してください")
    end

    it "frontが30文字を超える" do
      word = build(:word, front: Faker::Alphanumeric.alpha(number: 31))
      word.valid?
      expect(word.errors[:front]).to include("は30文字以内で入力してください")
    end

    it "reverseが30文字を超える" do
      word = build(:word, reverse: Faker::Alphanumeric.alpha(number: 31))
      word.valid?
      expect(word.errors[:reverse]).to include("は30文字以内で入力してください")
    end

    it "reverseが未入力" do
      word = build(:word, reverse: "")
      word.valid?
      expect(word.errors[:reverse]).to include("を入力してください")
    end

    it "wordbook_idがない" do
      word = build(:word, wordbook_id: nil)
      word.valid?
      expect(word.errors[:wordbook]).to include("を入力してください")
    end

  end

end